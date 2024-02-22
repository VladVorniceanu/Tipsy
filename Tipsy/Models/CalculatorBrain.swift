//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Vlad Vorniceanu on 22.02.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bill: Bill?
    
    mutating func calculateBill(billAmount: Float, tip: Float, splitTo: Double) {
        let splitValue = billAmount * tip / Float(splitTo)
        bill = Bill(billAmount: billAmount, tip: (tip-1) * 100, splitTo: splitTo, splitValue: splitValue)
    }
    
    func getTipPercentage() -> String {
        return String(format: "%.f", bill?.tip ?? 0.0)
    }
    
    func getSplitValue() -> Float {
        return bill?.splitValue ?? 0.0
    }
    func getNoOfSplits() -> Double {
        return bill?.splitTo ?? 1
    }
    
}
