//
//  DetailViewController.swift
//  iOS Example
//
//  Created by eliza on 2017-07-27.
//  Copyright © 2017 Andrew Simvolokov. All rights reserved.
//

import UIKit
import Image360

class DetailViewController: UIViewController {
    
    var imageView: Image360View?
    var image: UIImage?

    @IBOutlet var image360Controller: Image360Controller!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.image360Controller.image = image
        
        
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "detailContainerSegue":
                if let destination = segue.destination as? Image360Controller {
                    self.image360Controller = destination
                   
                }
            default:
                ()
            }
            
        }
        
        
    }
    

}
