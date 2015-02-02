//
//  ViewController.swift
//  TipsCalculator
//
//  Created by Hao Sun on 1/31/15.
//  Copyright (c) 2015 Hao Sun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var tipPercentages: Array<Double> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        self.tipPercentages = [
            loadUserPreference("tip1", defaultValue: 0.18),
            loadUserPreference("tip2", defaultValue: 0.20),
            loadUserPreference("tip3", defaultValue: 0.22)
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func BillEditingChanged(sender: AnyObject) {
        refreshValues()
    }

    @IBAction func onMainTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func saveUserPreference(key: NSString, value: Double) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(value, forKey: key)
        defaults.synchronize()
    }
    
    func loadUserPreference(key: NSString, defaultValue: Double) -> Double {
        var defaults = NSUserDefaults.standardUserDefaults()
        if defaults.doubleForKey(key) != 0 {
            return defaults.doubleForKey(key)
        } else {
            saveUserPreference(key, value: defaultValue)
            return defaultValue
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tipPercentages = [
            loadUserPreference("tip1", defaultValue: 0.18),
            loadUserPreference("tip2", defaultValue: 0.20),
            loadUserPreference("tip3", defaultValue: 0.22)
        ]
        
        tipControl.setTitle(String(format: "%d%%", Int(tipPercentages[0]*100)), forSegmentAtIndex: 0)
        tipControl.setTitle(String(format: "%d%%", Int(tipPercentages[1]*100)), forSegmentAtIndex: 1)
        tipControl.setTitle(String(format: "%d%%", Int(tipPercentages[2]*100)), forSegmentAtIndex: 2)
        
        refreshValues()
    }
    
    func refreshValues() {
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", billAmount+tip)
    }
}

