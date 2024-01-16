//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    
    func didUpdatePrice(price: String, currency: String)
    func didFailWithError(error: Error)
}



struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate"
    let apiKey = "BBBDF2B0-241A-4605-A267-2E2721CA0451"

    func getCoinPrice(for currency: String){
        let urlString = "\(baseURL)/BTC/\(currency)?apikey=\(apiKey)"
       
    
    
        
        //print(urlString)
        if let url = URL(string: urlString) {
            
            // Create a new URLSession object with default configuration
            let session = URLSession(configuration: .default)
            
            // Create a new data task for the URLSession
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let bitcoinPrice = self.parseJSON(safeData) {
                        let priceString = String(format: "%.2f", bitcoinPrice)
                        print(priceString)
                        self.delegate?.didUpdatePrice(price: priceString, currency: currency)
                    }
                }
                
                // Format the data we got back as a string to be able to print it
                //let dataAsString = String(data: data!, encoding: .utf8)
                //xprint(dataAsString)
            }
            
            // Start tasks to fetch data from bitcon average's servers
            task.resume()
        }
    }

    func parseJSON(_ data: Data) -> Double? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodedData.rate
            return lastPrice
            
            
        } catch {
//            delegate?.didFailWithError(error: error)
            print(error)
            return nil
        }
    }
    
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    
}

