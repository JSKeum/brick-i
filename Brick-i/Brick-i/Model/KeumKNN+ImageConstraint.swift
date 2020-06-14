//
//  KeumKNN+ImageConstraint.swift
//  Brick-i
//
//  Created by JSKeum on 2020/06/12.
//  Copyright © 2020 JSKeum. All rights reserved.
//

import Foundation
import CoreML

/// - Tag: ImageConstraintProperty
extension HandskNN {
    /// Returns the image constraint for the model's "drawing" input feature.
    var imageConstraint: MLImageConstraint {
        let description = model.modelDescription
        
        let inputName = "image"
        let imageInputDescription = description.inputDescriptionsByName[inputName]!
        
        return imageInputDescription.imageConstraint!
    }
    
//    modelDescription.inputDescriptionsByName["image"]!.imageConstraint!
}
