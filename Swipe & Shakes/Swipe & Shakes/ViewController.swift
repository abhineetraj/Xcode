//
//  ViewController.swift
//  Swipe & Shakes
//
//  Created by Abhineet Raj on 5/10/16.
//  Copyright © 2016 clinz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:") // variable created to capture the action of swiping right , we include colon to pass argument to the function swiped.
        
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight) // swiping right gesture is added to the view
    
    
        var swipeUp = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp) // swiping right gesture is added to the view
    
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) { // function to check if the device was shaken will be written outside the view did load method coz It has nothing to do with the iphone screen
        if event?.subtype == UIEventSubtype.MotionShake
        {
            print ("Device was shaken")
        }
    }
    
    

    func swiped(gesture: UISwipeGestureRecognizer)
    {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer
        {
            
            switch swipeGesture.direction
            {
                
            case UISwipeGestureRecognizerDirection.Right:
                    print("Swiped Right")
            case UISwipeGestureRecognizerDirection.Up:
                    print("Swiped Up")
            default:
                break
            }
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

