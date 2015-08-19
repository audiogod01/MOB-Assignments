//
//  jobDescriptionViewController.swift
//  HELPER
//
//  Created by Charlie Chao on 13/8/15.
//  Copyright (c) 2015 Charlie Chao. All rights reserved.
//

import UIKit
import Parse



class jobDescriptionViewController: UIViewController {
    
    var job: PFObject = PFObject(className: "")
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var jobNatureLabel: UILabel!
    @IBOutlet weak var jobDescriptionTextView: UITextView!
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //println(job)
        
        companyLabel.text = job["Company"] as? String
        contactNameLabel.text = job["ContactName"] as? String
        emailLabel.text = job["Email"] as? String
        phoneLabel.text = job["Phone"] as? String
        jobNatureLabel.text = job["JobNature"] as? String
        jobDescriptionTextView.text = job["JobDescription"] as? String
     
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
