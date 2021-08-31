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
        isUserInteractionEnabled = true
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

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        for view in subviews {
            let _point = self.convert(point, to: view)
            if !view.isHidden && view.isUserInteractionEnabled && view.alpha > 0.01 && view.point(inside: _point, with: event) {
                if let _view = view.hitTest(_point, with: event){
                    return _view
                }
            }
        }

        return super.hitTest(point, with: event)
    }
}
