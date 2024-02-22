//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Vlad Vorniceanu on 22.02.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var splitValueLabel: UILabel!
    @IBOutlet weak var splitFinalInterpretationLabel: UILabel!
    var splitValue: Float?
    var tipPercentageValue: String?
    var noOfSplits: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        splitValueLabel.text = String(format:"%.2f RON", splitValue!)
        splitFinalInterpretationLabel.text = "The shown value represents the total amount, split to \(Int(noOfSplits!)) people, with a \(tipPercentageValue!)% tip."
        
        // Do any additional setup after loading the view.
    }
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true) //inchide view/activ curenta
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
