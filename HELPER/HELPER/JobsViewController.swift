//
//  ViewController.swift
//  HELP
//
//  Created by Charlie Chao on 6/8/15.
//  Copyright (c) 2015 Charlie Chao. All rights reserved.
//

import Parse
import UIKit

class JobsViewController: UIViewController, UITableViewDataSource, PostJobViewControllerDelegate {
    

    @IBOutlet weak var tableView: UITableView!


    //var jobList: [PFObject] = []
    var jobList: [String] = []
    
    override func viewDidLoad() {
          super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reloadTable:",name:"reload", object: nil)
      
        tableView.dataSource = self
        
//        let job = PFObject(className: "Job")
//        job["Company"] = ""
//        job["ContactName"] = ""
//        job["Phone"] = ""
//        job["Email"] = ""
//        job["JobNature"] = ""
//        job["JobDescription"] = ""
//        job.saveInBackground()
        
        var query = PFQuery (className: "Job")
        
        query.orderByDescending("createdAt")
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            
            if (error == nil) {
                
               // println("success!")
                
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        var job = object["JobNature"] as? String
                        
                        if let job = job {
                            self.jobList.append(job)
                        }
                    }
                   // println("jobList is being printed")
                   // println(self.jobList)
                    self.tableView.reloadData()
                    
                }
                
            } else {
               // println("fail!")
            }
            //println("table is being created!")
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("reuse") as! UITableViewCell
        //var job = jobList[indexPath.row]["JobNature"] as? String
        
        println(indexPath.row)
        
        cell.textLabel?.text = jobList[indexPath.row]
        
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobList.count
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "PresentNewJobsViewControllerSegue") {
            // Don't understand "PresentNewJobsViewControllerSegue" how is being used
            
            let nav = segue.destinationViewController as! UINavigationController
            
            let postJobViewController = nav.topViewController as! PostJobViewController
            postJobViewController.delegate = self
            
        }
    }
    
    func postJobViewController(controller:PostJobViewController, company:String, contactName:String, Phone:String, Email:String, JobNature:String) {
        println(company)
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            // Animation Completed.  Code to be executed after animation completion
            
            
        })
    }
    
    func jobDidFinishPosting() {
        self.tableView.reloadData()
        
    }
    
    func reloadTable(notification: NSNotification){
        //load data here
        self.tableView.reloadData()
    }

    
//    func postJobViewControllerCompany(controller:PostJobViewController, company:String) {
//        println(company)
//        self.dismissViewControllerAnimated(true, completion: { () -> Void in
//            // Animation Completed.  Code to be executed after animation completion
//            
//        })
//    }
//    
//    func postJobViewControllerContactName(controller:PostJobViewController, contactName:String) {
//        println(contactName)
//        self.dismissViewControllerAnimated(true, completion: { () -> Void in
//             // Animation Completed.  Code to be executed after animation completion
//        })
//    }
//    
//    
//    func postJobViewControllerPhone(controller:PostJobViewController, Phone:String) {
//        println(Phone)
//        self.dismissViewControllerAnimated(true, completion: { () -> Void in
//            // Animation Completed.  Code to be executed after animation completion
//        })
//    }
//    
//    func postJobViewControllerEmail(controller:PostJobViewController, Email:String) {
//        println(Email)
//        self.dismissViewControllerAnimated(true, completion: { () -> Void in
//            // Animation Completed.  Code to be executed after animation completion
//        })
//    }
//    
//    func postJobViewControllerJobNature(controller:PostJobViewController, JobNature:String) {
//        println(JobNature)
//        self.dismissViewControllerAnimated(true, completion: { () -> Void in
//            // Animation Completed.  Code to be executed after animation completion
//        })
//    }
    
    
}

