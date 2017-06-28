//
//  ViewController.swift
//  Downloading an Image
//
//  Created by Abhineet Raj on 7/6/16.
//  Copyright © 2016 clinz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let url = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/2/25/Sachin_Tendulkar_at_MRF_Promotion_Event.jpg")
        
        
       let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in // // we need to intiate the session so that we can load the image from the previous variable.
        
        if error != nil
        {
            print(error)
        }
        else {
            
            var documentsDirectory:String? // will store the document location so that the image can be made available offline.
            
            var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) // google what domain mask is. ~ (replaced by true here) is used to show default location on the machine/iphone, true means it will give the full path of the file, if false will give short path.
            
            if paths.count > 0
            {
                documentsDirectory = paths[0] as? String // location where the image will be saved.
                
                let savePath = documentsDirectory! + "/sach.jpg"
                NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil) // saving the file in the location.
                
                
                dispatch_async(dispatch_get_main_queue(), { // remove this and we get warning that during the background process of NRURLSession, the images is getting updated. When we include the code, it waits for the process to complete and then the view of the image gets update inside the view controller. Now Autolayout engine is not gettting modified by the background thread.
                    /*if let sach = UIImage(data: data!)
                    {
                        self.image.image = sach
                    }*/
                    
                    
                    self.image.image = UIImage(named: savePath)
                })
                
                
            }
            

        
            
        }
        
        
        }
        
        task.resume()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

