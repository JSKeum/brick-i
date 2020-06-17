//
//  ViewController.swift
//  Brick-i
//
//  Created by JSKeum on 2020/05/25.
//  Copyright © 2020 JSKeum. All rights reserved.


import UIKit
import CoreML
import Vision

class InputImageViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //
        //        let desc = keumKNN().imageConstraint
        //        print(desc)
    }
    
    @IBOutlet weak var uploadImageView: UIImageView!
    
    private var updatableModel : MLModel?
    
    private var imageLabelDictionary : [UIImage : String] = [:]
    
    @IBAction func takePhoto(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func training(_ sender: Any) {
        
        train()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                self.uploadImageView.image = image
                
                self.imageLabelDictionary[image] = "이구아나"
                
                print(self.imageLabelDictionary)
                //                let animal = self.predict(image: image)
                
                
            }
        }
    }
    
    private let imageConstraint = ModelUpdater.imageConstraint
    
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
    
    
    
    //
    private func loadModel(url: URL) -> MLModel? {
        do {
            let config = MLModelConfiguration()
            config.computeUnits = .all
            return try MLModel(contentsOf: url, configuration: config)
        } catch {
            print("Error loading model: \(error)")
            return nil
        }
    }
    
    
    private func train() {
        do {
            let trainingData = batchProvider()
            
            //        let updatableModelURL = Models.trainedNearestNeighborsURL
            let modelURL = HandskNN.urlOfModelInThisBundle
            
            //        let config = model.configuration
            
            let modelConfig = updatableModel?.configuration
            //            modelConfig.computeUnits = .cpuAndGPU
            
            
            let updateTask = try MLUpdateTask(forModelAt: modelURL,
                                              trainingData: trainingData,
                                              configuration: modelConfig,
                                              completionHandler: { (finalContext) in
                                                
                                                
                                                //                                                    let fileManager = FileManager.default
                                                do {
                                                    
                                                    
                                                    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                                                    let fileURL = documentDirectory.appendingPathComponent("keumKNNin").appendingPathExtension("mlmodelc")
                                                    
                                                    
                                                    
                                                    try finalContext.model.write(to: fileURL)
                                                    
                                                    self.updatableModel = self.loadModel(url: fileURL)
                                                    
                                                    
                                                } catch(let error) {
                                                    print("error is \(error.localizedDescription)")
                                                }
                                                
            }
                
            )
            
            updateTask.resume()
            
        } catch {
            print("Error training k-NN:", error)
            //            trainingDidComplete(success: false)
        }
    }
    
    @IBAction func predict(_ sender: Any) {
        if let img = uploadImageView.image {
            predictImage(image: img)
        }
    }

    
    func predictImage(image: UIImage) {
        
        do{
            
            let imageOptions: [MLFeatureValue.ImageOption: Any] = [
                .cropAndScale: VNImageCropAndScaleOption.scaleFill.rawValue
            ]
            
            let featureValue = try MLFeatureValue(cgImage: image.cgImage!, constraint: imageConstraint, options: imageOptions)
            
            
            let featureProviderDict = try MLDictionaryFeatureProvider(dictionary: ["image" : featureValue])
            
            
            let prediction = try updatableModel?.prediction(from: featureProviderDict)
            
            
            let value = prediction?.featureValue(for: "label")?.stringValue
            let prob = prediction?.featureValue(for: "labelProbability")?.dictionaryValue
            
            print(value, prob)
            
        }catch(let error){
            print("error is \(error.localizedDescription)")
        }
        //        return nil
    }
    
    
}
