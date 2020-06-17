//
//  Predict.swift
//  Brick-i
//
//  Created by JSKeum on 2020/06/11.
//  Copyright © 2020 JSKeum. All rights reserved.
//

//import Foundation

import CoreML
import Vision
import QuartzCore

/**
  Describes the result of running the model on a single example.
 */
struct Prediction {
  let label: String
  let confidence: Double
  let probabilities: [AnyHashable: NSNumber]

  var sortedProbabilities: [(String, Double)] {
    probabilities.sorted { $0.1.doubleValue > $1.1.doubleValue }
                 .map { ($0.key as! String, $0.value as! Double) }
  }

  init?(result: MLFeatureProvider) {
    guard let predictedLabel = result.featureValue(for: "label")?.stringValue,
          let probabilities = result.featureValue(for: "labelProbability")?.dictionaryValue,
          let predictedProbability = probabilities[predictedLabel]?.doubleValue
    else {
      print("Error: could not read from result feature provider")
      return nil
    }

    self.label = predictedLabel
    self.confidence = predictedProbability
    self.probabilities = probabilities
  }
}

/**
  Used to make predictions using a Core ML model.

  Note that we don't use the automatically generated class here but use
  the MLModel API. This is done because you can use the Evaluate screen
  with different mlmodel files (untrained, Turi, and on-device trained).
 */
class Predictor {
  let model: MLModel
  let predictionOptions = MLPredictionOptions()
  var shouldCancel = false

  init(model: MLModel) {
    self.model = model
    predictionOptions.usesCPUOnly = false
  }

  /**
    Classifies a single image.
   */
  func predict(image: MLFeatureValue) -> Prediction? {
    let inputs: [String: Any] = [ "image": image ]
    guard let provider = try? MLDictionaryFeatureProvider(dictionary: inputs),
          let result = try? model.prediction(from: provider, options: predictionOptions),
          let prediction = Prediction(result: result) else {
      print("Inference error")
      return nil
    }
    return prediction
  }
}
