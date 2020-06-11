//
//  ViewController.swift
//  Brick-i
//
//  Created by JSKeum on 2020/05/25.
//  Copyright © 2020 JSKeum. All rights reserved.


import UIKit
import CoreML

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    private func batchProvider() -> MLArrayBatchProvider
    {

        var batchInputs: [MLFeatureProvider] = []
        let imageOptions: [MLFeatureValue.ImageOption: Any] = [
          .cropAndScale: VNImageCropAndScaleOption.scaleFill.rawValue
        ]
        for (image,label) in imageLabelDictionary {
            
            do{
                let featureValue = try MLFeatureValue(cgImage: image.cgImage!, constraint: imageConstraint, options: imageOptions)
              
                if let pixelBuffer = featureValue.imageBufferValue{
                    let x = keumKNNTrainingInput(image: pixelBuffer, label: label) //keumKNNUpdatableTrainingInput(image: pixelBuffer, classLabel: label)
                    batchInputs.append(x)
                }
            }
            catch(let error){
                print("error description is \(error.localizedDescription)")
            }
        }
     return MLArrayBatchProvider(array: batchInputs)
    }
    
    
    
    
    
    
    private func train() {
      do {
        let trainingData = try batchProvider()

        let updatableModelURL = Models.trainedNearestNeighborsURL

        let config = model.configuration

        let updateTask = try MLUpdateTask(forModelAt: updatableModelURL,
                                          trainingData: trainingData,
                                          configuration: config,
                                          completionHandler: { context in
          //print("Done!", context)

          // Overwrite the mlmodelc with the updated one.
          do {
            let tempURL = urlForModelInDocumentsDirectory("tempNearestNeighbors")
            try context.model.write(to: tempURL)

            Models.deleteTrainedNearestNeighbors()
            copyIfNotExists(from: tempURL, to: updatableModelURL)
            removeIfExists(at: tempURL)
          } catch {
            print("Error saving k-NN model:", error)
          }

          self.trainingDidComplete(success: true)
        })

        updateTask.resume()
      } catch {
        print("Error training k-NN:", error)
        trainingDidComplete(success: false)
      }
    }
}

