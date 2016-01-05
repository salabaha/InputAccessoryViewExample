//
//  SecondViewController.swift
//  InputAccessoryViewExample
//
//  Created by Roman Salabay on 1/5/16.
//  Copyright © 2016 salabaha. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var accessoryView: AccessoryView!
    
    override func viewWillAppear(animated: Bool) {
        if #available(iOS 9, *) {
            accessoryView.becomeFirstResponder()
        } else {
            self.view.becomeFirstResponder()
        }
    }
    
    override var inputAccessoryView: UIView? {
        if #available(iOS 9, *) {
            return accessoryView
        } else {
            return nil
        }
    }
    
    override func canBecomeFirstResponder() -> Bool {
        if #available(iOS 9, *) {
            return true
        } else {
            return false
        }        
    }
}