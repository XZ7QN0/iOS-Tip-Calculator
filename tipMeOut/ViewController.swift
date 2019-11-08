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
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet private var totalCostLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
               
        // Automatically focuses on the billField when first opening the app
        billField.becomeFirstResponder()
        
        // Sets the textfield placeholder to current locale currency symbol
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        
        billField.text = nil
        billField.placeholder = currencySymbol
    }

    // Dismisses keyboard by tapping anywhere on the screen
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    // TODO: Create a custom tip option with
    // text field that shows up only when pressed on UISegmentControl
    @IBAction func calculateTip(_ sender: Any) {
        
        // Get the intial bill amount and calculate tips
        let bill = Double(billField.text!) ?? 0
        let tipPercentages = [0.1, 0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex] as NSNumber
        
        // Currency formatting for international currencies
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        
        // Update the tip label
        tipPercentageLabel.text = formatter.string(from: tip)
        
        // Creates NSNumber array and assigns each label the calculated total cost value
        var totalCost = [NSNumber]()
        for number in 0...5 {
            totalCost.append(NSNumber(value: (bill + Double(truncating: tip)) / Double(number + 1)))
            totalCostLabels[number].text = formatter.string(for: totalCost[number])
        }
    }
}

