//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //this allows us to reference UI elements
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var diceImageView1: UIImageView!
    
     
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        /* print("Button got tapped.")
        diceImageView1.image = UIImage(imageLiteralResourceName: "DiceFour")
        diceImageView2.image = UIImage(imageLiteralResourceName: "DiceFour")
        */
        let diceArray = [ UIImage(imageLiteralResourceName: "DiceOne"),UIImage(imageLiteralResourceName: "DiceTwo"),UIImage(imageLiteralResourceName: "DiceThree"),UIImage(imageLiteralResourceName: "DiceFour"),UIImage(imageLiteralResourceName: "DiceFive"),UIImage(imageLiteralResourceName: "DiceSix"),UIImage(imageLiteralResourceName: "DiceOne")]
        
        diceImageView1.image = diceArray[Int.random(in: 0...5)]
        diceImageView2.image = diceArray[Int.random(in: 0...5)]
    
    }
    /* override func viewDidLoad() {
        super.viewDidLoad()
        
        //this changes the image, who, what, value formats
        diceImageView1.image = UIImage(imageLiteralResourceName: "DiceSix")
        diceImageView1.alpha = 0.5
        diceImageView2.image = UIImage(imageLiteralResourceName: "DiceTwo")
    }
        */
    
}

