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
        layer.cornerRadius = 20
        addMenuRecogniser()
    }

    // MARK: Gesture Recogniser

    private func addMenuRecogniser() {
        let longGestureRecogniser = UILongPressGestureRecognizer(target: self, action: #selector(longPressGestureAction))
        addGestureRecognizer(longGestureRecogniser)
    }

    @objc private func longPressGestureAction(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            showMenu(from: gesture)
            highlightScreen()
        }
    }

    // MARK: - UIMenuController

    private func showMenu(from gesture: UILongPressGestureRecognizer) {
        registerNotification()
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

    private func hideMenu() {
        unhighlightScreen(animated: false)
        UIMenuController.shared.hideMenu(from: self)
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
        UIPasteboard.general.string = label.text
    }

    override func paste(_ sender: Any?) {
        guard let numberToPaste = UIPasteboard.general.string?.doubleValue else { return }
        let userInfo = ["PasteKey": numberToPaste]
        NotificationCenter.default.post(name: Notification.Name("Mefisto.com.Calc.LCDDisplay.pasteNumber"), object: nil, userInfo: userInfo)
    }

    // MARK: - Color Themes

    func prepareToColorThemeUpdate() {
        hideMenu()
    }

    // MARK: - Animations

    private func highlightScreen() {
        let theme = ThemeManager.shared.currentTheme
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut) { [weak self] in
            self?.backgroundColor = UIColor(hex: theme.operationColor)
            self?.label.textColor = UIColor(hex: theme.operationTitleColor)
        }
    }

    private func unhighlightScreen(animated: Bool) {
        let theme = ThemeManager.shared.currentTheme
        if animated {
            UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut) { [weak self] in
                self?.backgroundColor = .clear
                self?.label.textColor = UIColor(hex: theme.displayColor)
            }
        } else {
            backgroundColor = .clear
            label.textColor = UIColor(hex: theme.displayColor)
        }
    }

    // MARK: - Notification

    private func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(willHideEditMenu(_:)), name: UIMenuController.willHideMenuNotification, object: nil)
    }

    private func unregisterNotification() {
        NotificationCenter.default.removeObserver(self, name: UIMenuController.willHideMenuNotification, object: nil)
    }

    @objc private func willHideEditMenu(_ notification: Notification) {
        unhighlightScreen(animated: true)
        unregisterNotification()
    }
}
