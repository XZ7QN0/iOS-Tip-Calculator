//
//  ViewController.swift
//  tipMeOut
//
//  Created by Jonathon Chenvert on 11/5/19.
//  Copyright © 2019 Jonathon Chenvert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Dismisses keyboard by tapping anywhere on the screen
    @IBAction func onTap(_ sender: Any) {
        print("Keyboard has been dismissed by user.")
        
        view.endEditing(true)
    }
    
    // TODO: Create a custom tip option with
    // text field that shows up only when pressed on UISegmentControl
    // TODO: Create initial launch screen that shows and describes how the app works (1st time only)
    /**
            Calculates the tip and the total balance from the user's bill
     - Important:
     This code has not gone through any QA.
     
     - Version:
     0.1
     */
    @IBAction func calculateTip(_ sender: Any) {
        // Get the intial bill amount
        let bill = Double(billField.text!) ?? 0
        
        // Calculate the tip value and total value
        let tipPercentages = [0.1, 0.15, 0.18, 0.2, 0.23, 0.25]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update the tip and total labels
        tipPercentageLabel.text = String(format: "$%.2f", tip)
        totalBillLabel.text = String(format: "$%.2f", total)
    }
}

