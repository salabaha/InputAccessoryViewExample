//
//  AccessoryView.swift
//  InputAccessoryViewExample
//
//  Created by Roman Salabay on 1/5/16.
//  Copyright © 2016 salabaha. All rights reserved.
//

import UIKit

class AccessoryView: UITextField {
    override var canBecomeFirstResponder: Bool {
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
        tintColor = UIColor.clear
    }
    
    override func accessibilityActivate() -> Bool {
        return false
    }
    
    override var isEditing: Bool {
        return false
    }
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        return .zero
    }
    
    override func selectionRects(for range: UITextRange) -> [UITextSelectionRect] {
        return []
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponder.copy(_:)) || action == #selector(UIResponder.selectAll(_:)) || action == #selector(UIResponder.paste(_:)){
            return false
        }
        
        return super.canPerformAction(action, withSender: sender)
    }
    
    override func addGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) {
        if gestureRecognizer is UILongPressGestureRecognizer {
            gestureRecognizer.isEnabled = false
        }
        
        super.addGestureRecognizer(gestureRecognizer)
    }
}

extension AccessoryView {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        if touches.first?.tapCount == 1 {
            sendActionsForControlEvents(.touchUpInside, with: event)
        }
    }
 
    func sendActionsForControlEvents(_ controlEvent: UIControl.Event, with event: UIEvent?) {
        for target in allTargets {
            if let actions = actions(forTarget: target, forControlEvent: controlEvent) {
                for action in actions {
                    sendAction(Selector(action), to: target, for: event)
                }
            }
        }
    }
}
