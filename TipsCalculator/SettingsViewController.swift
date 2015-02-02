//
//  SettingsViewController.swift
//  TipsCalculator
//
//  Created by Hao Sun on 2/2/15.
//  Copyright (c) 2015 Hao Sun. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tip1Field: UITextField!
    @IBOutlet weak var tip2Field: UITextField!
    @IBOutlet weak var tip3Field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var tip1 = Int(loadUserPreference("tip1", defaultValue: 0.18)*100)
        var tip2 = Int(loadUserPreference("tip2", defaultValue: 0.20)*100)
        var tip3 = Int(loadUserPreference("tip3", defaultValue: 0.22)*100)
        tip1Field.text = String(format: "%d", tip1)
        tip2Field.text = String(format: "%d", tip2)
        tip3Field.text = String(format: "%d", tip3)
    }
    
    @IBAction func onSettingsDone(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onScreenTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onTip1Changed(sender: AnyObject) {
        var newtip = NSString(string: tip1Field.text).doubleValue/100
        saveUserPreference("tip1", value: NSString(string: tip1Field.text).doubleValue/100)
    }
    
    @IBAction func onTip2Changed(sender: AnyObject) {
        saveUserPreference("tip2", value: NSString(string: tip2Field.text).doubleValue/100)
    }
    
    @IBAction func onTip3Changed(sender: AnyObject) {
        saveUserPreference("tip3", value: NSString(string: tip3Field.text).doubleValue/100)
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
}
