//
//  CompaniesViewController.swift
//  HELP
//
//  Created by Charlie Chao on 9/8/15.
//  Copyright (c) 2015 Charlie Chao. All rights reserved.
//

import UIKit
import Parse

class CompaniesViewController: UIViewController, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        
        //        let job = PFObject(className: "Job")
        //        job["Company"] = ""
        //        job["ContactName"] = ""
        //        job["Phone"] = ""
        //        job["Email"] = ""
        //        job["JobNature"] = ""
        //        job["JobDescription"] = ""
        //        job.saveInBackground()
        
        // Create the post
//        var myPost = PFObject(className:"Company")
//        myPost["Name"] = "Apple"
//        //myPost["Industry"] = "Consumer Electronics"
//        
//        // Create the comment
//        var myComment = PFObject(className:"Comment")
//        myComment["Content"] = "Nice iPhones"
//        
//        // Add a relation between the Post and Comment
//        myComment["parent"] = myPost
//        
//        // This will save both myPost and myComment
//        myComment.saveInBackground()
        
        
        // Do any additional setup after loading the view.
    }
    
    func getData() {
        
//        var query = PFQuery (className: "Job")
//        
//        query.orderByDescending("createdAt")
//        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
//            
//            if (error == nil) {
//                
//                // println("success!")
//                
//                if let objects = objects as? [PFObject] {
//                    for object in objects {
//                        println(object.objectId)
//                        
//                        var job = object["JobNature"] as? String
//                        //var id: [PFObject] = [object.objectId]
//                        
//                        if let job = job {
//                            self.jobList.append(job)
//                            
//                        }
//                    }
//                    // println("jobList is being printed")
//                    // println(self.jobList)
//                    self.tableView.reloadData()
//                    
//                }
//                
//            } else {
//                // println("fail!")
//            }
//            //println("table is being created!")
//            //            println("jobIds are ")
//            //            println(self.objectId)
//        }
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseCompanyIdentifier") as! UITableViewCell
        
        //println(indexPath.row)
        
        cell.textLabel?.text = "hello"
        
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return jobList.count
        
        return 8
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
