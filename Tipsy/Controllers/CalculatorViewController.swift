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
    
    var tipBrain = TipBrain()
    
    @IBAction func tippedChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        let buttons = [
            Button(button: zeroPctButton, value: 0.0),
            Button(button: tenPctButton, value: 0.1),
            Button(button: twentyPctButton, value: 0.2)
        ]
        for (index, button) in buttons.enumerated(){
            if index == sender.tag {
                button.button.isSelected = true
                tipBrain.setTipAmount(tip: button.value)
            } else {
                button.button.isSelected = false
            }
        }
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        tipBrain.setSplitNumber(number: sender.value)
        splitNumberLabel.text = String(sender.value)
        print(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        let cost = Double(billTextField.text ?? "0")!
        let total = tipBrain.calculateBill(cost: cost)
        print(total)
    }
    
}

