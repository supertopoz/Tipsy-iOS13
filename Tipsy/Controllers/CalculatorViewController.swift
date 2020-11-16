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
    
    var tipAmount: Double = 0.1
    var splitNumber: Double = 2.0
    
    struct Button {
        let button: UIButton
        let value: Double
    }
    
    @IBAction func tippedChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = true
        let buttons = [
            Button(button: zeroPctButton, value: 0.0),
            Button(button: tenPctButton, value: 0.1),
            Button(button: twentyPctButton, value: 0.2)
        ]
        for (index, button) in buttons.enumerated(){
            if index == sender.tag {
                button.button.isSelected = true
                tipAmount = button.value
            } else {
                button.button.isSelected = false
            }
        }
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        splitNumber = sender.value
        splitNumberLabel.text = String(sender.value)
        print(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        let tip = tipAmount
        let split = splitNumber
        let cost = Double(billTextField.text ?? "0")!
        var total = 0.0
        if tip <= 0.0 {
            total = cost / split
        } else {
            total = (cost + (cost * tip)) / split
        }
        print(total)
        
    }
    
}

