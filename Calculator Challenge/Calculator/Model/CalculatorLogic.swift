//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by intern on 2/28/23.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation



struct CalculatorLogic {
    
    private var number: Double?
    
    // tuple to store the previous data that the user inputted
    // 1 + 2
    // intemediateCalculation (n1: 1. calcMethod: 2)
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    
    // in order for us to change the value of the struct properties mutating functions
    mutating func setNumber(_ number : Double ) {
        self.number = number
    }
    
    //declare a function with one parameter that receives a string
    // a function that returns a optional double if the conditions goes out of scope?
    mutating func calculate ( symbol : String) -> Double? {
        
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        // returns a null value
        return nil
    }
    // this function receives the second number
    private func performTwoNumCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "÷":
                return n1 / n2
            case "×":
                return n1 * n2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            
            }
        }
        return nil
    }
}

