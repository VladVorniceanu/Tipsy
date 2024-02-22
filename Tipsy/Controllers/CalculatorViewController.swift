//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTotalInputField: UITextField!
    @IBOutlet weak var noTipButton: UIButton!
    @IBOutlet weak var tenTipButton: UIButton!
    @IBOutlet weak var twentyTipButton: UIButton!
    @IBOutlet weak var splitNoStepper: UIStepper!
    @IBOutlet weak var splitNoLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    
    var tipAmountValue:Float = 1.0
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTipButton()
        splitNoStepper.value = 1
        splitNoLabel.text = String(format: "%.0f",splitNoStepper.value)
        // Do any additional setup after loading the view.
    }
    
    func setTipButton() {
        noTipButton.isSelected = false
        tenTipButton.isSelected = false
        twentyTipButton.isSelected = false
    }

    @IBAction func stepperClicked(_ sender: UIStepper) {
        billTotalInputField.endEditing(true)
        splitNoLabel.text = String(format: "%.0f",sender.value)
    }
    
    @IBAction func tipSelected(_ sender: UIButton) {
        billTotalInputField.endEditing(true)

        setTipButton()
        sender.isSelected = true
        
        let tipAmount: String = sender.currentTitle ?? "0%"
        switch tipAmount {
        case "10%":
            tipAmountValue = 1.1
        case "20%":
            tipAmountValue = 1.2
        default:
            tipAmountValue = 1.0
        }
    }
    
    @IBAction func calculateSpliting(_ sender: Any) {
        let billValue = Float(billTotalInputField.text ?? "0")
        let splitNumber = Double(splitNoLabel.text ?? "1")
        calculatorBrain.calculateBill(billAmount: billValue!, tip: tipAmountValue, splitTo: splitNumber!)
        
        print(calculatorBrain.getSplitValue())
        print(calculatorBrain.getTipPercentage())
        print(calculatorBrain.getNoOfSplits())
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.splitValue = calculatorBrain.getSplitValue()
            destinationVC.noOfSplits = calculatorBrain.getNoOfSplits()
            destinationVC.tipPercentageValue = calculatorBrain.getTipPercentage()
        }
    }
    
}

