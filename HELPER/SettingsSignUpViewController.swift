//
//  SettingsSignUpViewController.swift
//  HELPER
//
//  Created by Charlie Chao on 14/8/15.
//  Copyright (c) 2015 Charlie Chao. All rights reserved.
//

import UIKit
import Parse

class SettingsSignUpViewController: UIViewController {
    
    var delegate: SettingsSignUpViewControllerDelegate! = nil
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var phoneNumberTextFiled: UITextField!
    
    @IBOutlet weak var newPasswordTextField: UITextField!
    
    @IBOutlet weak var retypePasswordTextField: UITextField!
    
    @IBAction func SignUpButtonPressed(sender: AnyObject) {
        
        if (passwordValidate() == true) {
            signUp()
        } else {
            // action to do
        }

    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            // Animation Completed.  Code to be executed after animation completion

        })
    }
    
    func signUp() {
        
        var user = PFUser()
        
        user["FirstName"] = firstNameTextField.text
        user["LastName"] = lastNameTextField.text
        user["PhoneNumber"] = phoneNumberTextFiled.text
        user["Profile_Pic"] = ""
        
        user.username = emailTextField.text
        user.password = newPasswordTextField.text
        user.email = emailTextField.text
        
        user.signUpInBackgroundWithBlock { (success, error) -> Void in
            
            if (success) {
                
                var alert = UIAlertController(title: "Success!", message: "Sign up successful!", preferredStyle: .Alert)
                
                alert.addAction(UIAlertAction(title: "OKAY", style: UIAlertActionStyle.Default, handler: { (alertAction) -> Void in
                    self.dismissViewControllerAnimated(true, completion: nil)
                    
                }))
                
                self.presentViewController(alert, animated: true, completion: nil)
                
            } else {
                
                var alertFail = UIAlertController(title: "Try Again", message: "Sign Up Unsuccessful!", preferredStyle: .Alert)
                
                alertFail.addAction(UIAlertAction(title: "OKAY", style: UIAlertActionStyle.Default, handler: { (alertAction) -> Void in
                    self.dismissViewControllerAnimated(true, completion: nil)
                }))
                
                self.presentViewController(alertFail, animated: true, completion: nil)
                
                
                //println(error?.localizedDescription)
            }
            
        }
    }
    
    func passwordValidate() -> Bool {
        
        var validate = true
        
        if (newPasswordTextField.text == retypePasswordTextField.text) {
            // move on to sign in process
            validate = true
            
        } else {
            
            var alertFail = UIAlertController(title: "Error", message: "Passwords not Matching\nTry Again", preferredStyle: .Alert)
            
            alertFail.addAction(UIAlertAction(title: "OKAY", style: UIAlertActionStyle.Default, handler: { (alertAction) -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
            }))
            
            self.presentViewController(alertFail, animated: true, completion: nil)
            
            validate = false
        }
        return validate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

protocol SettingsSignUpViewControllerDelegate {
    
    func settingsSignUpViewController(controller:SettingsSignUpViewController, company:String, contactName:String, Phone:String, Email:String, JobNature:String)
    
    //    func jobDidFinishPosting()
    
    
}
