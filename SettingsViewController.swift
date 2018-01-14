//
//  SettingsViewController.swift
//  fantastip
//
//  Created by Fernando Schaeffer-Araujo  on 1/13/18.
//  Copyright © 2018 Fernando Schaeffer-Araujo . All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //Access UserDefaults
    let defaults = UserDefaults.standard
    var defaultTip = 0.18

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Get the default tip value.
        defaultTip = defaults.double(forKey: "defaultTipAmount")
        switch defaultTip {
        case 0.15:
            defaultTipControl.selectedSegmentIndex = 0
        case 0.20:
            defaultTipControl.selectedSegmentIndex = 2
        default:
            defaultTipControl.selectedSegmentIndex = 1
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func setDefaultTip(_ sender: Any) {
        
        // set tip amounts and selected segment
        let tipPercentages = [0.15, 0.18, 0.20]
        defaultTip = tipPercentages[defaultTipControl.selectedSegmentIndex]
        
        // Set the tip value for the default tip key
        defaults.set(defaultTip, forKey: "defaultTipAmount")
        
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
