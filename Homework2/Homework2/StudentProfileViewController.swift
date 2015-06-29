//  Charlie Chao
//  StudentProfileViewController.swift
//  Homework2
//
//  Created by Kannan Chandrasegaran on 25/6/15.
//  Copyright (c) 2015 Kannan Chandrasegaran. All rights reserved.
//

import UIKit

class StudentProfileViewController: UIViewController {
    

    var student: Student = Student()
    
    @IBOutlet weak var labelFirstName: UILabel!
    @IBOutlet weak var labelLastName: UILabel!
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var labelAverageScore: UILabel!
    @IBOutlet weak var labelPhone: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // task 3
        
        labelFirstName.text = student.firstName
        labelLastName.text = student.lastName
        labelAge.text = String(student.age)
        labelAverageScore.text = String(stringInterpolationSegment: averageScore(student.scores))  //task 5
        profilePic.imageFromUrl(student.profilePicURL)  // Task 7

        // task 6
        
        if let num = student.phoneNumber {
            
            //println(num)
            labelPhone.text = String(num)
            
            
        } else {
            
            labelPhone.text = "n/a"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func averageScore (scores: [Int]) -> Double {
        
        var count = scores.count
        
        //println(count)
        
        if count == 0 {
            return 0
        }
        
        var sum = 0
        
        for score in scores {
            sum += score
            //println(scores)
            // println(sum)
        }
        
        var result: Double = Double(sum) / Double(count)
        return result
        
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
