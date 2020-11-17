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
        splitNumberLabel.text = String(format: "%.f", sender.value)
        print(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        
        guard let cost = Double(billTextField.text ?? "0") else { return }
        let total = tipBrain.calculateBill(cost: cost)
        print(total)
        
        performSegue(withIdentifier: "showResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showResult" {
            var destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = tipBrain.total
            var description = "Split between \(String(format: "%.0f", tipBrain.splitNumber))  people, with \(String(format: "%.0f", tipBrain.tipAmount * 100) ) % tip."
            destinationVC.settings = description
        }
    }
    
}

