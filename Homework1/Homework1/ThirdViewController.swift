
import UIKit

class ThirdViewController: UIViewController  {
  /*
  TODO six: Hook up the number input text field, button and text label to this class. When the button is pressed, a message should be printed to the label indicating whether the number is even.
  
  */
    
    
    @IBOutlet weak var Number: UITextField!
    
    @IBOutlet weak var Label: UILabel!
    
    @IBAction func calcClick(sender: AnyObject) {
        
 
        
        let number : Int? = Number.text.toInt()

        
        if number! % 2 == 0 {
            
            Label.text = "even number"
        }
        
        else{
            Label.text = "not even number"
        }
        
    }
    
}
