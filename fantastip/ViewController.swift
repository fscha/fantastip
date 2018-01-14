//
//  ViewController.swift
//  fantastip
//
//  Created by Fernando Schaeffer-Araujo  on 1/13/18.
//  Copyright © 2018 Fernando Schaeffer-Araujo . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set focus to bill amount
        billField.becomeFirstResponder();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")

        
        // Get the default tip value.
        let defaultTip = defaults.double(forKey: "defaultTipAmount")
        
        switch defaultTip {
        case 0.15:
            tipControl.selectedSegmentIndex = 0
        case 0.20:
            tipControl.selectedSegmentIndex = 2
        default:
            tipControl.selectedSegmentIndex = 1
        }
        
        // Calculate tip again
        calculateTip(billField)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        // tip amounts
        let tipPercentages = [0.15, 0.18, 0.20]
        
        // calculate tip, total
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // display tip, total
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
}

