//
//  ViewController.swift
//  Calculator
//
//  Created by intern on 2/28/23.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    // private function var to be accesed only in the specific class
    private var isFinishedTypingNumber: Bool = true
    
    
    // a variable which has a value of Double
    private var displayValue: Double {
        
        // getter for getting the values of the displayLabel.text
        get {
            
            // I use guard to prevent the app from crashing if the value is nil
            // The displayLabel.text is Converted into Double which we force Unwrapped
            guard let number = Double(displayLabel.text!) else {
                // if the displayLabel.text cannot be converted to a Double
                // the else block will be triggered and it will throw a fatalError message
                fatalError("Cannot convert display label text to a Double.")
            }
            
            // returns the number
            return number
        }
        
        // setter for setting the values of the displayValue which the user entered
        set {
            
            displayLabel.text = String(newValue)
        }
    }
    
    // declare a private object
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        
        
        //What should happen when a non-number button is pressed
        
        print("You pressed the equation\(sender.currentTitle!)")
        
        
        //keyboard ( checks if the user is done typing)
        isFinishedTypingNumber = true
        
        // sets the value private var in the calculator logic
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            // guard let for checking if the returned value  is null
            // if the returned value is not null then the data is stored in the guard let result
            // else if the calcMethod is null it will throw in a fatal error and stop the app
            if let result = calculator.calculate(symbol: calcMethod){
                displayValue = result
            }
        
        }
    }
    
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        // print("You pressed the number \(sender.currentTitle!)")
        // displayLabel.text = sender.currentTitle!
        // safety check for the app to not crash
        // checks if the sender has value
        if let numValue = sender.currentTitle {
            
            // to type hunderds and thousands of values we add a boolean value to check if the user is finished typing
            // the user presses a number then the value isFinishedTyping will be false and the program proceeds to else block to apped the numbers being pressed by the user
            if isFinishedTypingNumber{
                displayLabel.text = numValue
                isFinishedTypingNumber = false
                
            }
            
            // ---> appends pressed values of the user
            else {
                
                // check if the user inputtef a proper decimal point
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
//                    if !isInt{
//                        return
//                    }
                    if displayLabel.text!.contains(".") {
                        return
                    }
                    
                }
                // displays data
                displayLabel.text = displayLabel.text! + numValue
            }
        }
        
        
    }
    
    
    
}
