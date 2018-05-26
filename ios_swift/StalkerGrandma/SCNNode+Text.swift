/**
 
 Copyright 2017 IBM Corp. All Rights Reserved.
 Licensed under the Apache License, Version 2.0 (the 'License'); you may not
 use this file except in compliance with the License. You may obtain a copy of
 the License at
 http://www.apache.org/licenses/LICENSE-2.0
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an 'AS IS' BASIS, WITHOUT
 WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 License for the specific language governing permissions and limitations under
 the License.
 */
 
import Foundation
import ARKit
import SwiftyJSON

public extension SCNNode {
    convenience init(classificationId: String, position: SCNVector3){
        let bubbleDepth : Float = 0.001 // the 'depth' of 3D text
        // TEXT BILLBOARD CONSTRAINT
        let billboardConstraint = SCNBillboardConstraint()
        billboardConstraint.freeAxes = SCNBillboardAxis.Y
        var fullName = ""
        var location = ""
        var Sit = ""
        var Study = ""
        if classificationId == "Ferdi"{
            // Full Name text
            fullName = Constant.FerdiName
            location = Constant.FerdiLoc
            Sit = Constant.FerdiSit
            Study = Constant.FerdiStudy
        }
        
        let fullNameBubble = SCNText(string: fullName, extrusionDepth: CGFloat(bubbleDepth))
        fullNameBubble.font = UIFont(name: "Avenir", size: 0.30)?.withTraits(traits: .traitBold)
        fullNameBubble.alignmentMode = kCAAlignmentCenter
        fullNameBubble.firstMaterial?.diffuse.contents = UIColor.red
        fullNameBubble.firstMaterial?.specular.contents = UIColor.white
        fullNameBubble.firstMaterial?.isDoubleSided = true
        fullNameBubble.chamferRadius = CGFloat(bubbleDepth)
        // fullname BUBBLE NODE
        let (minBound, maxBound) = fullNameBubble.boundingBox
        let fullNameNode = SCNNode(geometry: fullNameBubble)
        // Centre Node - to Centre-Bottom point
        fullNameNode.pivot = SCNMatrix4MakeTranslation( (maxBound.x - minBound.x)/2, minBound.y, bubbleDepth/2)
        // Reduce default text size
        fullNameNode.scale = SCNVector3Make(0.1, 0.1, 0.1)
        fullNameNode.simdPosition = simd_float3.init(x: 0.06, y: 0.12, z: 0)
        
        //location
        let locBubble = SCNText(string: location, extrusionDepth: CGFloat(bubbleDepth))
        locBubble.font = UIFont(name: "Avenir", size: 0.20)?.withTraits(traits: .traitBold)
        locBubble.alignmentMode = kCAAlignmentCenter
        locBubble.firstMaterial?.diffuse.contents = UIColor.white
        locBubble.firstMaterial?.specular.contents = UIColor.white
        locBubble.firstMaterial?.isDoubleSided = true
        locBubble.chamferRadius = CGFloat(bubbleDepth)
        // fullname BUBBLE NODE
        //let (minBoundL, maxBoundL) = linkedInBubble.boundingBox
        let locNode = SCNNode(geometry: locBubble)
        // Centre Node - to Centre-Bottom point
        locNode.pivot = SCNMatrix4MakeTranslation( (maxBound.x - minBound.x)/2, minBound.y, bubbleDepth/2)
        // Reduce default text size
        locNode.scale = SCNVector3Make(0.1, 0.1, 0.1)
        locNode.simdPosition = simd_float3.init(x: 0.07, y: 0.1, z: 0)
        
        
        let StudyNameBubble = SCNText(string: Study, extrusionDepth: CGFloat(bubbleDepth))
        StudyNameBubble.font = UIFont(name: "Avenir", size: 0.20)?.withTraits(traits: .traitBold)
        StudyNameBubble.alignmentMode = kCAAlignmentCenter
        StudyNameBubble.firstMaterial?.diffuse.contents = UIColor.white
        StudyNameBubble.firstMaterial?.specular.contents = UIColor.white
        StudyNameBubble.firstMaterial?.isDoubleSided = true
        StudyNameBubble.chamferRadius = CGFloat(bubbleDepth)
        // fullname BUBBLE NODE
        //let (minBound, maxBound) = StudyNameBubble.boundingBox
        let StudyNameNode = SCNNode(geometry: StudyNameBubble)
        // Centre Node - to Centre-Bottom point
        StudyNameNode.pivot = SCNMatrix4MakeTranslation( (maxBound.x - minBound.x)/2, minBound.y, bubbleDepth/2)
        // Reduce default text size
        StudyNameNode.scale = SCNVector3Make(0.1, 0.1, 0.1)
        StudyNameNode.simdPosition = simd_float3.init(x: 0.07, y: 0.08, z: 0)
        
        let SitNameBubble = SCNText(string: Sit, extrusionDepth: CGFloat(bubbleDepth))
        SitNameBubble.font = UIFont(name: "Avenir", size: 0.20)?.withTraits(traits: .traitBold)
        SitNameBubble.alignmentMode = kCAAlignmentCenter
        SitNameBubble.firstMaterial?.diffuse.contents = UIColor.white
        SitNameBubble.firstMaterial?.specular.contents = UIColor.white
        SitNameBubble.firstMaterial?.isDoubleSided = true
        SitNameBubble.chamferRadius = CGFloat(bubbleDepth)
        // fullname BUBBLE NODE
        //let (minBound, maxBound) = SitNameBubble.boundingBox
        let SitNameNode = SCNNode(geometry: SitNameBubble)
        // Centre Node - to Centre-Bottom point
        SitNameNode.pivot = SCNMatrix4MakeTranslation( (maxBound.x - minBound.x)/2, minBound.y, bubbleDepth/2)
        // Reduce default text size
        SitNameNode.scale = SCNVector3Make(0.1, 0.1, 0.1)
        SitNameNode.simdPosition = simd_float3.init(x: 0.07, y: 0.06, z: 0)
        
        // fullname BUBBLE NODE
        //let (minBoundL, maxBoundL) = linkedInBubble.boundingBox
        

        
        
        //        // 3D IMAGE NODE
        //        let faceScene = SCNScene(named: "art.scnassets/ship.scn")
        //        //let box = SCNBox.init(width: 0.5, height: 0.5, length: 0.01, chamferRadius: 0)
        //        let boxNode = SCNNode()
        //        //faceScene!.rootNode.addChildNode(boxNode)
        //        boxNode.addChildNode((faceScene?.rootNode)!)
        //        boxNode.scale = SCNVector3Make(0.2, 0.2, 0.2)
        //        boxNode.simdPosition = simd_float3.init(x: -0.05, y: 0, z: 0)
        
        // CENTRE POINT NODE
        let plane = SCNPlane(width: 0.20, height: 0.17)
        plane.firstMaterial?.diffuse.contents = UIColor.gray
        let planeNode = SCNNode(geometry: plane)
        planeNode.simdPosition = simd_float3.init(x: 0.07, y: 0.12, z: -0.1)
        planeNode.opacity = 0.4
        
        
        let sphere = SCNSphere(radius: 0.004)
        sphere.firstMaterial?.diffuse.contents = UIColor.red
        let sphereNode = SCNNode(geometry: sphere)
        sphereNode.opacity = 0.6
        
        self.init()
        addChildNode(fullNameNode)
        addChildNode(SitNameNode)
        addChildNode(StudyNameNode)
        addChildNode(locNode)
        if fullName != ""{
            addChildNode(planeNode)
        }
        
        constraints = [billboardConstraint]
        self.position = position
    }
    
    
    
    convenience init(withText text : String, position: SCNVector3) {
        let bubbleDepth : Float = 0.01 // the 'depth' of 3D text
        
        // TEXT BILLBOARD CONSTRAINT
        let billboardConstraint = SCNBillboardConstraint()
        billboardConstraint.freeAxes = SCNBillboardAxis.Y
        
        // BUBBLE-TEXT
        let bubble = SCNText(string: text, extrusionDepth: CGFloat(bubbleDepth))
        bubble.font = UIFont(name: "Futura", size: 0.15)?.withTraits(traits: .traitBold)
        bubble.alignmentMode = kCAAlignmentCenter
        bubble.firstMaterial?.diffuse.contents = UIColor.orange
        bubble.firstMaterial?.specular.contents = UIColor.white
        bubble.firstMaterial?.isDoubleSided = true
        bubble.chamferRadius = CGFloat(bubbleDepth)
        
        // BUBBLE NODE
        let (minBound, maxBound) = bubble.boundingBox
        let bubbleNode = SCNNode(geometry: bubble)
        // Centre Node - to Centre-Bottom point
        bubbleNode.pivot = SCNMatrix4MakeTranslation( (maxBound.x - minBound.x)/2, minBound.y, bubbleDepth/2)
        // Reduce default text size
        bubbleNode.scale = SCNVector3Make(0.1, 0.1, 0.1)
        bubbleNode.simdPosition = simd_float3.init(x: 0.06, y: 0.09, z: 0)

        self.init()
        //addChildNode(bubbleNode)
        constraints = [billboardConstraint]
        self.position = position
    }
    
    func move(_ position: SCNVector3)  {
        SCNTransaction.begin()
        SCNTransaction.animationDuration = 0.4
        SCNTransaction.animationTimingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
        self.position = position
        opacity = 1
        SCNTransaction.commit()
    }
    
    func hide()  {
        SCNTransaction.begin()
        SCNTransaction.animationDuration = 0.5
        SCNTransaction.animationTimingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
        opacity = 0
        SCNTransaction.commit()
    }
    
    func show()  {
        opacity = 0
        SCNTransaction.begin()
        SCNTransaction.animationDuration = 0.4
        SCNTransaction.animationTimingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
        opacity = 1
        SCNTransaction.commit()
    }
}

private extension UIFont {
    // Based on: https://stackoverflow.com/questions/4713236/how-do-i-set-bold-and-italic-on-uilabel-of-iphone-ipad
    func withTraits(traits:UIFontDescriptorSymbolicTraits...) -> UIFont {
        let descriptor = self.fontDescriptor.withSymbolicTraits(UIFontDescriptorSymbolicTraits(traits))
        return UIFont(descriptor: descriptor!, size: 0)
    }
}
