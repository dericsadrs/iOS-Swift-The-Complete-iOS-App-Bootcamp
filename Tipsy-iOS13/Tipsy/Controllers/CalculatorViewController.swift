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
    
    
    var tipToAdd = 0.10
    var numberOfpeople = 2
    var billTotal = 0.0
    var calculatedBill = 0.0
    var finalResults = "0.0"
    
    
    
    
    
    //IBA function for chnaging the tip: 0 | 10 | 20 |
    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        billTextField.endEditing(true)
        let tip = sender.currentTitle!
        let removePercent = String(tip.dropLast())
        let tipInt = Double(removePercent)!
        tipToAdd = tipInt / 100
    
        billTextField.endEditing(true)
        

        
    }
    
    //changes the value of the tip
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfpeople = Int(sender.value)
        
        
        
        
    }
    
    //calculates the bill
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        if bill != " "{
            billTotal = Double(bill)!
            print(billTotal)
            calculatedBill = billTotal * (1 + tipToAdd) / Double(numberOfpeople)
            finalResults = String(format: "%.2f", calculatedBill)
            print(finalResults)
            
            self.performSegue(withIdentifier: "goToResults", sender: self)
        }
        
       
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if segue.identifier == "goToResults" {
                
                let destinationVC = segue.destination as! ResultsViewController
                destinationVC.result = finalResults
                destinationVC.tip = Int(tipToAdd * 100)
                destinationVC.split = numberOfpeople
            }
        }
  
}
