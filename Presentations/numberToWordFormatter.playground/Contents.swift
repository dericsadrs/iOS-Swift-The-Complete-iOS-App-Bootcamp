//
//  numberToWordFormatter.swift
//  numberToWordFormatter
//
//  Created by intern on 2/20/23.
//

import Foundation

func spellOutAmount(number: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut

    let first = Int(number)
    let second = Int(round((number - Double(first)) * 100))

    var spelledOutNumber = ""
    
    if first == 0 {
        spelledOutNumber = formatter.string(for: NSNumber(value: second))! + (second == 1 ? " cent only" : " cents only")
    } else {
        spelledOutNumber = formatter.string(for: NSNumber(value: first))! + " peso" + (first == 1 ? " and " : "s and ") + formatter.string(for: NSNumber(value: second))! + (second == 1 ? " cent only" : " cents only")
    }
    
    return spelledOutNumber
}

print(spellOutAmount(number: 0.78)) // "seventy-eight cents only"
print(spellOutAmount(number: 1289.80)) // "one thousand two hundred eighty-nine pesos and eighty cents only"


