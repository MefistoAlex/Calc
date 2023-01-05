//
//  LCDDisplay.swift
//  Calc
//
//  Created by Alexandr Mefisto on 01.01.2023.
//

import UIKit

class LCDDisplay: UIView {
    // MARK: - IBOutlets

    @IBOutlet var label: UILabel!

    // MARK: - Initialisers

    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }

    private func sharedInit() {
        addMenuRecogniser()
    }

    // MARK: Gesture Recogniser

    private func addMenuRecogniser() {
        let longGestureRecogniser = UILongPressGestureRecognizer(target: self, action: #selector(longPressGestureAction))
        addGestureRecognizer(longGestureRecogniser)
    }

    @objc private func longPressGestureAction(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            print("We have perform the long press")
            showMenu(from: gesture)
        }
    }

    // MARK: - UIMenuController

    private func showMenu(from gesture: UILongPressGestureRecognizer) {
        becomeFirstResponder()
        let menu = UIMenuController.shared
        guard menu.isMenuVisible == false else { return }
        let locationOfTouch = gesture.location(in: self)
        var rect = bounds
        rect.origin = locationOfTouch
        rect.origin.y -= 20
        rect.size = CGSize(width: 1, height: 44)
        menu.showMenu(from: self, rect: rect)
    }

    override var canBecomeFirstResponder: Bool {
        true
    }

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return
            action == #selector(UIResponderStandardEditActions.copy(_:)) ||
            action == #selector(UIResponderStandardEditActions.paste(_:))
    }

    override func copy(_ sender: Any?) {
        print("copy pressed")
    }

    override func paste(_ sender: Any?) {
        print("paste pressed")
    }
}
