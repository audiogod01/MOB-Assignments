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

    var jobList: [PFObject] = []
    
    override func viewDidAppear(animated: Bool) {
        getData()
    }
    
    override func viewWillAppear(animated: Bool) {        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
       
    override func viewDidLoad() {
          super.viewDidLoad()

        tableView.dataSource = self
        getData()
        
    }
    
    
    func getData() {
        
        var query = PFQuery (className: "Job")
        
        query.orderByDescending("createdAt")
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
        
            if (error == nil) {
                
                if let objects = objects as? [PFObject] {
                    self.jobList = objects // [PFObject]
                    self.tableView.reloadData()
                }
                
            } else {
                println("fail!")
            }
//            println("table is being created!")
//            println("jobIds are ")
//            println(self.objectId)
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("reuse") as! UITableViewCell

        var name = jobList[indexPath.row]["JobNature"] as? String
        var jobCompany = jobList[indexPath.row]["Company"] as? String
        if let name = name {
            cell.textLabel?.text = name
            cell.detailTextLabel?.text = jobCompany
        }
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
            
            let nav = segue.destinationViewController as! UINavigationController
            let postJobViewController = nav.topViewController as! PostJobViewController
            postJobViewController.delegate = self
            
        } else if (segue.identifier == "JobDescriptionSegue") {
            
            var destinationVC = segue.destinationViewController as! jobDescriptionViewController
        
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                destinationVC.job = jobList[indexPath.row]
            }
            
        }
    }
    
    func postJobViewController(controller:PostJobViewController, company:String, contactName:String, Phone:String, Email:String, JobNature:String) {
        println(company)
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            // Animation Completed.  Code to be executed after animation completion
            
            self.getData()
        })
    }
    
    
}

