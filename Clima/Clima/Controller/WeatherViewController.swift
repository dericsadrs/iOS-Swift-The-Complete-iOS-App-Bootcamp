//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

// import for accesing the location of the user
import CoreLocation

// inherit the class UITextFieldDelegate
class WeatherViewController: UIViewController{
    
    //IB Outlets
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    let locationManger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManger.delegate = self
        //asks the user for permission
        // a pop-up appears on the screen
        locationManger.requestWhenInUseAuthorization()
        locationManger.requestLocation()
        weatherManager.delegate = self
        //tell controller to bring up the keyboard
        searchTextField.delegate = self
    }
    
    
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManger.requestLocation()
    }
    
}



// MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    
    // IB button for search pressed
    @IBAction func searchPressed(_ sender: UIButton) {
        
        //hides the keyboard if the user is done editing
        searchTextField.endEditing(true)
        //print("searchTextField value: \(searchTextField.text!)")
    }
    
    // if the user presses the return button in the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //print("textFieldShouldReturn value: \(searchTextField.text!)")
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != " " {
            return true
        } else {
            textField.placeholder = " Type Something"
            return false
        }
    }
    
    // resets the textfield once the go button is pressed
    // gives a new blank search bar
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = " "
    }
}


// MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel){
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName

        }
        
            }
    func didFailWithError(error: Error) {
        print(error)
    }
}


// MARK: - CLLocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManger.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }

    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
