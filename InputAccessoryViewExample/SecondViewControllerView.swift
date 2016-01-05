//
//  SecondViewControllerView.swift
//  InputAccessoryViewExample
//
//  Created by Roman Salabay on 1/5/16.
//  Copyright © 2016 salabaha. All rights reserved.
//

import UIKit

class SecondViewControllerView: UIView {
    @IBOutlet weak var accessoryView: AccessoryView!
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override var inputAccessoryView: UIView? {
        return accessoryView
    }
}
