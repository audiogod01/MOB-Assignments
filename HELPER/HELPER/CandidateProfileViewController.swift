//
//  CandidateProfileViewController.swift
//  HELPER
//
//  Created by Charlie Chao on 14/8/15.
//  Copyright (c) 2015 Charlie Chao. All rights reserved.
//

import UIKit
import Parse


class CandidateProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate /* ,UINavigationController */  {
   
    
//    var delegate: CandidateProfileViewController! = nil
    var user:PFUser = PFUser()
    var currentUser = PFUser.currentUser()
    
    //var userPhoto: PFObject = ""
   
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var profileDescription: UITextView!
    @IBOutlet weak var imagePicked: UIImageView!
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)

    }
    
    @IBAction func postButtonPushed(sender: AnyObject) {
        
        if  currentUser != nil {
            
            // Do stuff with the user
            
            var profile = PFObject(className: "Profile")
            
            profile["FirstName"] = firstNameTextField.text
            profile["LastName"] = lastNameTextField.text
            profile["Email"] = emailTextField.text
            profile["PhoneNumber"] = phoneNumberTextField.text
            profile["ProfileDescription"] = profileDescription.text
            
            // Push image selected onto Parse
            
            var imageDataConv = UIImageJPEGRepresentation(imagePicked.image, 0.6)
            var imageFile = PFFile(name:"image.jpg", data:imageDataConv)
            
            profile["ProfilePhoto"] = imageFile
            profile["CreatedBy"] = currentUser
            profile.saveInBackgroundWithBlock({ (success, error) -> Void in
                
                //checkSavedProperly(success)
                
                if (success) {
                    
                    var alert = UIAlertController(title: "Success!", message: "Your profile is ready\nfor everyone to see!", preferredStyle: .Alert)
                    
                    alert.addAction(UIAlertAction(title: "OKAY", style: UIAlertActionStyle.Default, handler: { (alertAction) -> Void in
                        
                        self.dismissViewControllerAnimated(true, completion: nil)
                    }))
                    
                    self.presentViewController(alert, animated: true, completion: nil)
                    // println("hello, job saved!")
                    
                } else {
                    
                    
                    var alertFail = UIAlertController(title: "Try Again", message: "Something went wrong!", preferredStyle: .Alert)
                    
                    alertFail.addAction(UIAlertAction(title: "OKAY", style: UIAlertActionStyle.Default, handler: { (alertAction) -> Void in
                        // self.dismissViewControllerAnimated(true, completion: nil)
                    }))
                    self.presentViewController(alertFail, animated: true, completion: nil)
                        // println(error?.localizedDescription)
                }
                
            })
            
        } else {
            // Show the signup or login screen
            var alertUserLogIn = UIAlertController(title: "Not Logged In", message: "Please Login first before we can post your profile", preferredStyle: .Alert)
            
            alertUserLogIn.addAction(UIAlertAction(title: "OKAY", style: UIAlertActionStyle.Default, handler: { (alertAction) -> Void in
                // self.dismissViewControllerAnimated(true, completion: nil)
            }))
            self.presentViewController(alertUserLogIn, animated: true, completion: nil)
            // println(error?.localizedDescription)

        }
        
    }
    
    @IBAction func cancelButtonPushed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            // Animation Completed.  Code to be executed after animation completion
        })
    }
    
    @IBAction func Camera(sender: AnyObject) {
        
//        Camera Access
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            imagePicker.allowsEditing = false
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func photoLibrary(sender: AnyObject) {
        
//        Photo Library Access
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            imagePicker.allowsEditing = false
            self.presentViewController(imagePicker, animated: true, completion: nil)

        }
    }
    
//    Image Picker Delegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        imagePicked.image = image
        self.dismissViewControllerAnimated(true, completion: nil);
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //scrollView.contentSize.height = 1000
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
            }

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



protocol CandidateProfileViewControllerDelegate {
    
    func candidateProfileVC(controller:CandidateProfileViewController, company:String, contactName:String, Phone:String, Email:String, JobNature:String)
    
}
