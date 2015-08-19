//
//  PostJobViewController.swift
//  HELP
//
//  Created by Charlie Chao on 6/8/15.
//  Copyright (c) 2015 Charlie Chao. All rights reserved.
//

import UIKit
import Parse


class PostJobViewController: UIViewController {
    
    var delegate: PostJobViewControllerDelegate! = nil
    
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var contactNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var jobNatureTextField: UITextField!
    @IBOutlet weak var jobDescriptionTextField: UITextView!
    @IBOutlet var jobDescription: [UITextView]!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        
//        self.delegate.postJobViewController(self, company: companyTextField.text, contactName: contactNameTextField.text, Phone: phoneTextField.text, Email: emailTextField.text, JobNature: jobNatureTextField.text)
        
        let job = PFObject(className: "Job")
        job["Company"] = companyTextField.text
        job["ContactName"] = contactNameTextField.text
        job["Phone"] = phoneTextField.text
        job["Email"] = emailTextField.text
        job["JobNature"] = jobNatureTextField.text
        job["JobDescription"] = jobDescriptionTextField.text
        
        job.saveInBackgroundWithBlock { (success, error) -> Void in
            
            if (success) {
                
                var alert = UIAlertController(title: "Success!", message: "Job saved successfully!", preferredStyle: .Alert)
                
                alert.addAction(UIAlertAction(title: "OKAY", style: UIAlertActionStyle.Default, handler: { (alertAction) -> Void in
//                    self.dismissViewControllerAnimated(true, completion: nil)
                    self.delegate.postJobViewController(self, company: self.companyTextField.text, contactName: self.contactNameTextField.text, Phone: self.phoneTextField.text, Email: self.emailTextField.text, JobNature: self.jobNatureTextField.text);
                }))
                
                self.presentViewController(alert, animated: true, completion: nil)
                // println("hello, job saved!")
                
            } else {
                
                var alertFail = UIAlertController(title: "Try Again", message: "Job Saved Unsuccessfully!", preferredStyle: .Alert)
                
                alertFail.addAction(UIAlertAction(title: "OKAY", style: UIAlertActionStyle.Default, handler: { (alertAction) -> Void in
//                    self.dismissViewControllerAnimated(true, completion: nil)
                }))
                
                self.presentViewController(alertFail, animated: true, completion: nil)
                
                
                //println(error?.localizedDescription)
            }
            //reloadTable()
        }
    }
    
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            // Animation Completed.  Code to be executed after animation completion
            
          
            
         //   self.delegate.postJobViewController(self, company: companyTextField.text, contactName: contactNameTextField.text, Phone: phoneTextField.text, Email: emailTextField.text, JobNature: jobNatureTextField.text)
            
            
        })
        
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


protocol PostJobViewControllerDelegate {
    
    func postJobViewController(controller:PostJobViewController, company:String, contactName:String, Phone:String, Email:String, JobNature:String)
 
}
