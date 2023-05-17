//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

// UIPickerView added to provide data in any UIPickerViews
class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, CoinManagerDelegate {
    
    // to set the number of columns in our picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    var coinManager = CoinManager()
    
    // to determine the number of rows/currencies
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    // method that expects a string as output which is the title for a given row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    // this will get called eveytime the user scrolls the picker, it will record the row number that was selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // to pass the selected currency to the CoinManager 
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
        //getCoinPrice(for: selectedCurrency)
//            print(row)
//            print(coinManager.currencyArray[row])
    }

    @IBOutlet weak var bitcoinLabel: UILabel!
    
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinManager.delegate = self
        // Do any additional setup after loading the view.
        // to set data scource for the picker
        currencyPicker.dataSource = self
        // to set the ViewController class as the delegate of the currencyPicker
        currencyPicker.delegate = self
    }
    
    func didUpdatePrice(price: String, currency: String) {
        
        Dispatch.DispatchQueue.main.async {
            self.bitcoinLabel.text = price
            self.currencyLabel.text = currency
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    

    
}

