//
//  SettingsViewController.swift
//  HELP
//
//  Created by Charlie Chao on 9/8/15.
//  Copyright (c) 2015 Charlie Chao. All rights reserved.
//

import UIKit
import Parse

class SettingsViewController: UIViewController, SettingsSignUpViewControllerDelegate {
    
    @IBOutlet weak var emailTextFiled: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signInButtonPressed(sender: AnyObject) {
        
        // Log_In
        
        PFUser.logInWithUsernameInBackground(emailTextFiled.text, password: passwordTextField.text) { (user, error) -> Void in
        
        
            if (error == nil) {
                
                var alert = UIAlertController(title: "Success!", message: "Login successful!", preferredStyle: .Alert)
                
                alert.addAction(UIAlertAction(title: "OKAY", style: UIAlertActionStyle.Default, handler: { (alertAction) -> Void in
                    self.dismissViewControllerAnimated(true, completion: nil)
                    
                }))
                
                self.presentViewController(alert, animated: true, completion: nil)
                
            } else {
                
                var alertFail = UIAlertController(title: "Oops", message: "Login Unsuccessful!", preferredStyle: .Alert)
                
                alertFail.addAction(UIAlertAction(title: "OKAY", style: UIAlertActionStyle.Default, handler: { (alertAction) -> Void in
                    self.dismissViewControllerAnimated(true, completion: nil)
                }))
                
                self.presentViewController(alertFail, animated: true, completion: nil)
                
               // println(error?.localizedDescription)
            }

        }

    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "PresentSettingsViewControllerSegue") {
            
            //let nav = segue.destinationViewController as! UINavigationController
            let nav = segue.destinationViewController as! SettingsNavigationController
            let settingSignUpViewController = nav.topViewController as! SettingsSignUpViewController
            settingSignUpViewController.delegate = self
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func settingsSignUpViewController(controller:SettingsSignUpViewController, company:String, contactName:String, Phone:String, Email:String, JobNature:String) {
        
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            // Animation Completed.  Code to be executed after animation completion
            
            
        })
    }

}
