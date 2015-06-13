
import UIKit

class FirstViewController: UIViewController {
  /*
  TODO one: hook up a button in interface builder to a new function (to be written) in this class. Also hook up the label to this class. When the button is clicked, the function to be written must make a label say ‘hello world!’
    */
    
    var message:String = ""
    
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var buttonClick: UIButton!
    
    @IBOutlet weak var Name: UITextField!
    
    @IBOutlet weak var Age: UITextField!
    
    @IBAction func buttonClick(sender: AnyObject) {
        
        message = "hello world!"
        greeting()
        
        ID()
        
        legalAge()
        
        whatCanYouDo()
    }
    
    func greeting() {
        Label.text = message
    }
    
    func ID() {
        Label.text = "Hello " + Name.text + " you are " + Age.text + " years old!"
    }
    
    func legalAge() {
        let number : Int? = Age.text.toInt()
        
        if number >= 21 {
            Label.text = "You can drink"
        }
        
        else if number >= 18 {
            Label.text = "you can vote"
        }
        
        else if number >= 16 {
            Label.text = "You can drive"
        }
        
        else {
            
        }
    }
    
    func whatCanYouDo () {
        let number : Int? = Age.text.toInt()
        
        if number >= 16 {
            
            if number <= 18 {
                Label.text = "You can drive"
            }
        }
        
        if number >= 18 {
            
            if number <= 21 {
                Label.text = "You can drive and vote"
            }
        }
        
        if number >= 21 {
            
            
                Label.text = "You can drive, vote and drink (but not at the same time!)"
            
        }
    }
    
  /*
  TODO two: Connect the ‘name’ and ‘age’ text boxes to this class. Hook up the button to a NEW function (in addition to the function previously defined). That function must look at the string entered in the text box and print out “Hello {name}, you are {age} years old!”
  TODO three: Hook up the button to a NEW function (in addition to the two above). Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”
  TODO four: Hook up the button to a NEW function (in additino to the three above). Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.
  */
}
