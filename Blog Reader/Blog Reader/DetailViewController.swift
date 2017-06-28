//
//  DetailViewController.swift
//  Blog Reader
//
//  Created by Abhineet Raj on 7/24/16.
//  Copyright © 2016 clinz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

//    @IBOutlet weak var detailDescriptionLabel: UILabel! because it is deleted

    @IBOutlet weak var webView: UIWebView!

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            // if let label = self.detailDescriptionLabel { since detail label is deleted
            
            if let postWebView = self.webView
            {
                postWebView.loadHTMLString(detail.valueForKey("content")!.description, baseURL: NSURL( string:"http://googleblog.blogspot.co.uk/"))
            
            }
                //label.text = detail.valueForKey("title")!.description
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

