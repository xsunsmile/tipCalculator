//
//  SettingsViewController.swift
//  TipsCalculator
//
//  Created by Hao Sun on 1/31/15.
//  Copyright (c) 2015 Hao Sun. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveUserSetting(value: Int, key: String) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(value, forKey: key)
        defaults.synchronize()
    }
    
    func findUserSetting(key: String) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.integerForKey(key)
    }
    
    func tipPercentageKey () {
        "UserSettingTipPercentage"
    }
    
    @IBAction func saveTipPercentage(sender: AnyObject) {
        println("called")
    }
}
