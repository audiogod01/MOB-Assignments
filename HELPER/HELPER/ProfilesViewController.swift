//
//  ProfilesViewController.swift
//  HELP
//
//  Created by Charlie Chao on 9/8/15.
//  Copyright (c) 2015 Charlie Chao. All rights reserved.
//
//  The Profiles of individual seeking jobs are under class "Candidates"

import UIKit
import Parse

class ProfilesViewController: UIViewController, UITableViewDataSource, CandidateProfileViewControllerDelegate {
    

    var profileList: [PFObject] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        getData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        getData()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "PresentProfileViewControllerSegue") {
            
            let nav = segue.destinationViewController as! ProfileViewNavigationController
            let setting = nav.topViewController as! CandidateProfileViewController
            //setting.delegate = self
                     
        } else if (segue.identifier == "IndividualProfileViewSegue") {
            
            var destinationVC = segue.destinationViewController as! IndividualProfileViewController
            
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                destinationVC.profile = profileList[indexPath.row]
            }
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileList.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseProfileIdentifier") as! UITableViewCell
        
        var name = profileList[indexPath.row]["FirstName"] as? String
        if let name = name {
            cell.textLabel?.text = name
        }
        
        var photo = profileList[indexPath.row]["ProfilePhoto"] as? PFFile
        if let photo = photo {
            photo.getDataInBackgroundWithBlock({ (imageData: NSData?, error: NSError?) -> Void in
                if error == nil {
                    if let imageData = imageData {
                        var image = UIImage(data: imageData)
                        
                        var targetSize = CGSize(width: 50, height: 50)
                        
                        if let image = image {
                            if (image.size.height > image.size.width) {
                                targetSize.height = 50
                                targetSize.width = (image.size.width / image.size.height) * 50.0
                            } else {
                                targetSize.width = 50
                                targetSize.height = (image.size.height / image.size.width) * 50.0
                                
                            }
                        }
                        
                        
//                        println(cell.imageView?.frame)
                        
                        UIGraphicsBeginImageContext(CGSize(width: 50, height: 50))
                        image?.drawInRect(CGRect(x: 0, y: 0, width: targetSize.width, height: targetSize.height))
                        var rescaledImage = UIGraphicsGetImageFromCurrentImageContext()
                        
                        cell.imageView?.contentMode = UIViewContentMode.ScaleAspectFill
                        cell.imageView?.image = rescaledImage
                        cell.imageView?.layer.cornerRadius = 25
                        cell.imageView?.clipsToBounds = true
                        
                        UIGraphicsEndImageContext() 
                        
//                        println(cell.imageView?.frame)
                    
                    }
                }
            })
        }
        return cell
    }
    
    func getData() {
        
        var query = PFQuery (className: "Profile")
        
        query.orderByDescending("createdAt")
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            
            if (error == nil) {
                
                if let objects = objects as? [PFObject] {
                    self.profileList = objects // [PFObject]
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
    
    // to be used in the future
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func candidateProfileVC(controller:CandidateProfileViewController, company:String, contactName:String, Phone:String, Email:String, JobNature:String) {
        
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            //            // Animation Completed.  Code to be executed after animation completion
        })
        
    }

}
