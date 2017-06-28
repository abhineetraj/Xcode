//
//  ViewController.swift
//  Swipe & Shakes
//
//  Created by Abhineet Raj on 5/10/16.
//  Copyright © 2016 clinz. All rights reserved.
//

import UIKit
import AVFoundation // is a framework import methods for playing audio visual media

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()
    var sounds = ["Tiger-roarin","Horse-neighing"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) { // function to check if the device was shaken will be written outside the view did load method coz It has nothing to do with the iphone screen
        if event?.subtype == UIEventSubtype.MotionShake
        {
            var randomNumber = Int(arc4random_uniform(UInt32(sounds.count))) // to get the random number which will then be used to refer to the array position
            
            
            
            let fileLocation = NSBundle.mainBundle().pathForResource(sounds[randomNumber], ofType: "mp3")
            
            var error: NSError? = nil
            
            //player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!), error: &error)
            
            do
            {
            
         try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!),
            
            player.play()
            
            }
            
            catch
      
            {
            error = NSError.&error
               
            }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

