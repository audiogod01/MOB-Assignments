
import UIKit

class SecondViewController: UIViewController {
  
  //TODO five: Display the cumulative sum of all numbers added every time the ‘add’ button is pressed. Hook up the label, text box and button to make this work.
    
    var a = 0
    
    @IBOutlet weak var numberField: UITextField!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBAction func AddClick(sender: AnyObject) {
        
        displaySum()
      
        
    }
        
        
        func displaySum() {
            
            let number : Int? = numberField.text.toInt()
            
            
            a = number! + a
            totalLabel.text = String(a)
        }
}
