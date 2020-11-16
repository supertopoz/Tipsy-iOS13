//
//  TipBrain.swift
//  Tipsy
//
//  Created by Jason.Allshorn on 2020/11/17.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct TipBrain {
    var tipAmount: Double = 0.1
    var splitNumber: Double = 2.0
    
    mutating func setTipAmount(tip: Double){
        tipAmount = tip
    }
    
    mutating func setSplitNumber(number: Double){
        splitNumber = number
    }
    
    func calculateBill(cost: Double) -> Double {
        if tipAmount <= 0.0 {
            return cost / splitNumber
        } else {
            return (cost + (cost * tipAmount)) / splitNumber
        }
    }
    
}
