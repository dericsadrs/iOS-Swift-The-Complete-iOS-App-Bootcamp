//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    //sett default values
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    //IBA function for chnaging the tip: 0 | 10 | 20 |
    @IBAction func tipChanged(_ sender: UIButton) {
        
        
        billTextField.endEditing(true)
        
        //defualt value not unless selected
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        //changes the value of the above declared variables
        sender.isSelected = true
        
        print(sender.currentTitle!)
        
        //computes the Tip
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
        
        print("Button Title: \(buttonTitle)")
        print("Button Minus Percentage Sign\(buttonTitleMinusPercentSign)")
        
    }
    
    //changes the value of the tip
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        print("stepperValueChanged \( sender.value)")
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    //calculates the bill
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        print(sender.currentTitle!)
        print("Number of people to split the bill  \(splitNumberLabel.text!)")
        let bill = billTextField.text!
        
        //checks if the bill has any value
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
        }
        // calls the next screen withTheIdentifier "goToResults"
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResults" {
            
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
        }
    }
}
