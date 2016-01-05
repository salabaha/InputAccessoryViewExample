//
//  AccessoryView.swift
//  InputAccessoryViewExample
//
//  Created by Roman Salabay on 1/5/16.
//  Copyright © 2016 salabaha. All rights reserved.
//

import UIKit

class AccessoryView: UITextField {
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        disableShowingKeyboard()
        hideCursor()
    }
}

extension AccessoryView {
    
    private func disableShowingKeyboard() {
        inputView = UIView()
    }
    
    private func hideCursor() {
        tintColor = UIColor.clearColor()
    }
    
    override func accessibilityActivate() -> Bool {
        return false
    }
    
    override var editing: Bool {
        return false
    }
    
    override func caretRectForPosition(position: UITextPosition) -> CGRect {
        return CGRectZero
    }
    
    override func selectionRectsForRange(range: UITextRange) -> [AnyObject] {
        return []
    }
    
    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        if action == "copy:" || action == "selectAll:" || action == "paste:" {
            return false
        }
        
        return super.canPerformAction(action, withSender: sender)
    }
    
    override func addGestureRecognizer(gestureRecognizer: UIGestureRecognizer) {
        if gestureRecognizer is UILongPressGestureRecognizer {
            gestureRecognizer.enabled = false
        }
        
        super.addGestureRecognizer(gestureRecognizer)
    }
}

extension AccessoryView {
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        if touches.first?.tapCount == 1 {
            sendActionsForControlEvents(.TouchUpInside, withEvent: event)
        }
    }
    
    func sendActionsForControlEvents(controlEvents: UIControlEvents, withEvent event: UIEvent?) {
        for target in allTargets() {
            if let actions = actionsForTarget(target, forControlEvent: controlEvents) {
                for action in actions {
                    sendAction(Selector(action), to: target, forEvent: event)
                }
            }
        }
    }
}