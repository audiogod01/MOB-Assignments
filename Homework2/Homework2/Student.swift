//
//  Student.swift
//  Homework2
//
//  Created by Kannan Chandrasegaran on 25/6/15.
//  Copyright (c) 2015 Kannan Chandrasegaran. All rights reserved.
//

import Foundation
import UIKit

class Student {
  var firstName:String = "defaultfirst"
  var lastName:String = "defaultlast"
  var age:Int = 0
  var scores:[Int] = []
  var phoneNumber:Int?
  var profilePicURL:String = ""
}


// Task 7

extension UIImageView {
    
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
                (response: NSURLResponse!, data: NSData?, error: NSError!) -> Void in
                if let unwrappedData = data {
                    self.image = UIImage(data: unwrappedData)
                }
            }
        }
        
        
    }
    
}
