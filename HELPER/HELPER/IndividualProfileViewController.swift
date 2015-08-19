//
//  IndividualProfileViewController.swift
//  HELPER
//
//  Created by Charlie Chao on 14/8/15.
//  Copyright (c) 2015 Charlie Chao. All rights reserved.
//

import UIKit
import Parse


class IndividualProfileViewController: UIViewController {
    
    //var delegate: IndividualProfileViewController! = nil
    
    var profile: PFObject = PFObject(className: "")
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var profileDescriptionTextView: UITextView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
        
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //scrollView.contentSize.height = 1000
                
        //println("data from ProfileTable")
        //println(profile)
        //profileImageView = profile["ProfilePhoto"] as PFFile
        
        firstNameLabel.text = profile["FirstName"] as? String
        lastNameLabel.text = profile["LastName"] as? String
        emailLabel.text = profile["Email"] as? String
        phoneNumberLabel.text = profile["PhoneNumber"] as? String
        profileDescriptionTextView.text = profile["ProfileDescription"] as? String
        
        if let userImageFile = profile["ProfilePhoto"] as? PFFile {
            userImageFile.getDataInBackgroundWithBlock {
                (imageData: NSData?, error: NSError?) -> Void in
                if error == nil {
                    if let imageData = imageData {
                        let image = UIImage(data:imageData)
                        self.profileImageView.image = image
                        self.profileImageView.autoresizingMask = UIViewAutoresizing.FlexibleBottomMargin | UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleRightMargin | UIViewAutoresizing.FlexibleLeftMargin | UIViewAutoresizing.FlexibleTopMargin | UIViewAutoresizing.FlexibleWidth
                        self.profileImageView.contentMode = UIViewContentMode.ScaleAspectFit
                            
                    }
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    
    //    func resizeImage(image:UIImage, toTheSize size:CGSize)->UIImage{
    //
    //        var scale = CGFloat(max(size.width/image.size.width,
    //            size.height/image.size.height))
    //        var width:CGFloat  = image.size.width * scale
    //        var height:CGFloat = image.size.height * scale
    //        var rr:CGRect = CGRectMake( 0, 0, width, height)
    //
    //        UIGraphicsBeginImageContextWithOptions(size, false, 0)
    //        image.drawInRect(rr)
    //        let newImage = UIGraphicsGetImageFromCurrentImageContext()
    //        UIGraphicsEndImageContext()
    //        return newImage
    //    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


