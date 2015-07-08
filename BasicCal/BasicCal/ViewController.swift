//
//  ViewController.swift
//  BasicCal
//
//  Created by Charlie Chao on 7/7/15.
//  Copyright (c) 2015 Charlie Chao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isOperand: Bool = false
    var firstNumber = 0.0
    var secondNumber = 0.0
    var operation = "="

    @IBOutlet weak var calculatorDisplay: UILabel!

//    @IBAction func percentClick(sender: AnyObject) {
//        var number = 0.0000
//        number = Double(calculatorDisplay.text!.toInt()!/100)
//        calculatorDisplay.text = String(stringInterpolationSegment: number)
//        println(calculatorDisplay.text)
//        //firstNumber = Double(calculatorDisplay.text!.toInt()!)
//        isOperand = false
//    }


    @IBAction func allClearClick(sender: AnyObject) {
        calculatorDisplay.text = "0"
        firstNumber = 0.0
        secondNumber = 0.0
        isOperand = false
    }

    @IBAction func clearClick(sender: AnyObject) {

        firstNumber = 0.0
        calculatorDisplay.text = "0"
        isOperand = false
    }



    @IBAction func numberClick(sender: UIButton) {

        let digit = sender.currentTitle!

        if (isOperand == true) {

            calculatorDisplay.text = calculatorDisplay.text! + digit
            firstNumber = Double(calculatorDisplay.text!.toInt()!)

            } else {

            calculatorDisplay.text = digit
            firstNumber = Double(calculatorDisplay.text!.toInt()!)
            isOperand = true
        }

    }


    @IBAction func calculationClick(sender: AnyObject) {



        if (isOperand == true) {
            operation = (sender.currentTitle!)!
            secondNumber = Double(calculatorDisplay.text!.toInt()!)

            //println(secondNumber)
            isOperand = false

        } else if (isOperand == false) {
            //secondNumber = Double(calculatorDisplay.text!.toInt()!)
            calculate(operation)
            //calculatorDisplay.text = "hello"
        }

        //isOperand = false
    }



    func calculate(String) {
        isOperand = false
        var result = 0.0

        if (operation == "+") {

            result = firstNumber + secondNumber

        } else if (operation == "-") {

            result = secondNumber - firstNumber

        } else if (operation == "x") {

            result = secondNumber * firstNumber

        } else if (operation == "÷") {

            if (secondNumber == 0) {

                calculatorDisplay.text = "Error"

            } else {
                result = secondNumber / firstNumber
            }
            
        }
        
        calculatorDisplay.text = "\(result)"

    }



    @IBAction func equalClick(sender: AnyObject) {

        isOperand = false
        var result = 0.0

        if (operation == "+") {

            result = firstNumber + secondNumber

         } else if (operation == "-") {

            result = secondNumber - firstNumber

        } else if (operation == "x") {

            result = secondNumber * firstNumber

        } else if (operation == "÷") {

            if (secondNumber == 0) {

                calculatorDisplay.text = "Error"

            } else {
                result = secondNumber / firstNumber
            }

        }

        calculatorDisplay.text = "\(result)"

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    


}

