//
//  ViewController.swift
//  iOS Example
//
//  Copyright © 2017 Andrew Simvolokov. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.



// ***** this is for 3 image motion lagging test ****** //
// when testing, don't touch gesture.

import UIKit
import Image360

private let picture1URL = Bundle.main.url(forResource: "picture1", withExtension: "jpg")!
private let picture2URL = Bundle.main.url(forResource: "picture2", withExtension: "jpg")!

class ViewController: UIViewController {

    /*
    @IBOutlet var angleXZSlider: UISlider!
    @IBOutlet var angleYSlider: UISlider!
    @IBOutlet var fovSlider: UISlider!
 */

    @IBOutlet var image360Controller: Image360Controller!
    
    @IBOutlet var image360Controller2: Image360Controller!
    
    @IBOutlet var image360Controller3: Image360Controller!
    
    @IBOutlet var image360Controller4: Image360Controller!

    
    @IBOutlet weak var container4: UIView!
    @IBOutlet weak var container3: UIView!
    @IBOutlet weak var container2: UIView!
    @IBOutlet weak var container1: UIView!
    
    var whatType: Int = 0
    

    //@IBOutlet var pictureSegmentedControl: UISegmentedControl!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "image1":
                if let destination = segue.destination as? Image360Controller {
                    self.image360Controller = destination
                    //self.image360Controller.imageView.observer = self as! Image360ViewObserver
                }
                
            case "image2":
                if let destination = segue.destination as? Image360Controller {
                    self.image360Controller2 = destination
                    //self.image360Controller2.imageView.observer = self as! Image360ViewObserver
                }
            case "image3":
                if let destination = segue.destination as? Image360Controller {
                    self.image360Controller3 = destination
                    //self.image360Controller3.imageView.observer = self as! Image360ViewObserver
                }
            case "image4":
                if let destination = segue.destination as? Image360Controller {
                    self.image360Controller4 = destination
                    //self.image360Controller4.imageView.observer = self as! Image360ViewObserver
                }
            case "detailSegue":
                if let destination = segue.destination as? DetailViewController {
                    switch whatType {
                    case 1:
                        destination.imageView = image360Controller.imageView
                        destination.image = image360Controller.image
                    case 2:
                        destination.imageView = image360Controller2.imageView
                        destination.image = image360Controller2.image
                    case 3:
                        destination.imageView = image360Controller3.imageView
                        destination.image = image360Controller3.image
                    case 4:
                        destination.imageView = image360Controller4.imageView
                        destination.image = image360Controller4.image
                    default:
                        ()
                   // print("Dd") // how to pass data ?
                }
                }
//            case "settings":
//                if let destination = segue.destination as? SettingsController {
//                    destination.inertia = image360Controller.inertia
//                    destination.pictureIndex = pictureSegmentedControl.selectedSegmentIndex
//                    destination.isOrientationViewHidden = image360Controller.isOrientationViewHidden
//                    destination.isDeviceMotionControlEnabled = image360Controller.isDeviceMotionControlEnabled
//                    destination.isGestureControlEnabled = image360Controller.isGestureControlEnabled
//                }
            default:
                ()
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
        self.image360Controller2.image = UIImage(named: "picture2.jpg")
        self.image360Controller.image = UIImage(named: "picture1.jpg")
        self.image360Controller3.image = UIImage(named: "pano01.jpg")
        self.image360Controller4.image = UIImage(named: "pano04.jpg")
        
        
        
//        if pictureSegmentedControl.selectedSegmentIndex < 0 {
//            pictureSegmentedControl.selectedSegmentIndex = 0
//            segmentChanged(sender: pictureSegmentedControl)
//        }
//    
//        pictureSegmentedControl.isHidden = true
        
        // or for swift 2 +
        
        let gesture = UITapGestureRecognizer(target: self, action: "someAction:")
        let gesture2 = UITapGestureRecognizer(target: self, action: "someAction2:")
        let gesture3 = UITapGestureRecognizer(target: self, action: "someAction3:")
        let gesture4 = UITapGestureRecognizer(target: self, action: "someAction4:")


        let gestureSwift2AndHigher = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        
        self.container1.addGestureRecognizer(gesture)
        self.container2.addGestureRecognizer(gesture2)
        self.container3.addGestureRecognizer(gesture3)
        self.container4.addGestureRecognizer(gesture4)

    }

    func someAction(sender:UITapGestureRecognizer){
        print("click")
        // do other task
    }
    
    // or for Swift 3
    func someAction(_ sender:UITapGestureRecognizer){
        whatType = 1
        performSegue(withIdentifier: "detailSegue", sender: whatType)
        // do other task
    }
    func someAction2(_ sender:UITapGestureRecognizer){
        whatType = 2
        performSegue(withIdentifier: "detailSegue", sender: whatType)
        // do other task
    }
    func someAction3(_ sender:UITapGestureRecognizer){
        whatType = 3
        performSegue(withIdentifier: "detailSegue", sender: whatType)
        // do other task
    }
    func someAction4(_ sender:UITapGestureRecognizer){
        whatType = 4
        performSegue(withIdentifier: "detailSegue", sender: whatType)
        // do other task
    }
    
    @IBAction func unwindToViewController(segue: UIStoryboardSegue) {
        guard let settingsController = segue.source as? SettingsController else {
            assertionFailure("Unexpected controller's type")
            return
        }
        image360Controller.inertia = settingsController.inertia
        //pictureSegmentedControl.selectedSegmentIndex = settingsController.pictureIndex
        image360Controller.isOrientationViewHidden = settingsController.isOrientationViewHidden
        image360Controller.isDeviceMotionControlEnabled = settingsController.isDeviceMotionControlEnabled
        image360Controller.isGestureControlEnabled = settingsController.isGestureControlEnabled
        //segmentChanged(sender: pictureSegmentedControl)
        print("?") // no show
    }
    
    

//    @IBAction func segmentChanged(sender: UISegmentedControl) {
//        let pictureURL: URL
//        switch sender.selectedSegmentIndex {
//        case 0:
//            pictureURL = picture1URL
//        case 1:
//            pictureURL = picture2URL
//        default:
//            assertionFailure("Unexpected selected segment index")
//            return
//        }
//
//        do {
//            let data = try Data(contentsOf: pictureURL)
//            
//            if let image = UIImage(data: data) {
//                self.image360Controller2.image = UIImage(named: "picture2.jpg")
//                self.image360Controller.image = image
//                self.image360Controller3.image = UIImage(named: "pano01.jpg")
//                self.image360Controller4.image = UIImage(named: "pano04.jpg")
//            } else {
//                NSLog("liveView - frameData is not image")
//            }
//        } catch  {
//
//        }
//    }
    /*

    @IBAction func angleXZSliderChanged(sender: UISlider) {
        image360Controller.imageView.observer = nil
        let imageView = image360Controller.imageView
        let newRotationAngleXZ = (imageView.rotationAngleXZMax - imageView.rotationAngleXZMin) * sender.value + imageView.rotationAngleXZMin
        print("newRotationAngleXZ: ", newRotationAngleXZ) //
        image360Controller.imageView.setRotationAngleXZ(newValue: newRotationAngleXZ)
        image360Controller.imageView.observer = self
    }

    @IBAction func angleYSliderChanged(sender: UISlider) {
        image360Controller.imageView.observer = nil
        let imageView = image360Controller.imageView
        let newRotationAngleY = (imageView.rotationAngleYMax - imageView.rotationAngleYMin) * sender.value + imageView.rotationAngleYMin
        print("newRotationAngleY: ", newRotationAngleY) //
        image360Controller.imageView.setRotationAngleY(newValue: newRotationAngleY)
        image360Controller.imageView.observer = self
    }

    @IBAction func fovSliderChanged(sender: UISlider) {
        image360Controller.imageView.observer = nil
        let imageView = image360Controller.imageView
        let newFOV = (imageView.cameraFOVDegreeMax - imageView.cameraFOVDegreeMin) * sender.value + imageView.cameraFOVDegreeMin
        
        print("newFov: ", newFOV) //
        
        image360Controller.imageView.setCameraFovDegree(newValue: newFOV)
        image360Controller.imageView.observer = self
    }
 */
}

/*


// MARK: - Image360ViewObserver
extension ViewController: Image360ViewObserver {
    func image360View(_ view: Image360View, didChangeFOV cameraFov: Float) {

    }

    func image360View(_ view: Image360View, didRotateOverY rotationAngleY: Float) {
        angleYSlider.value = (rotationAngleY - view.rotationAngleYMin) / (view.rotationAngleYMax - view.rotationAngleYMin)
    }

    func image360View(_ view: Image360View, didRotateOverXZ rotationAngleXZ: Float) {
        angleXZSlider.value = (rotationAngleXZ - view.rotationAngleXZMin) / (view.rotationAngleXZMax - view.rotationAngleXZMin)
    }
}
*/

