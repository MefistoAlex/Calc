//
//  CalcViewController.swift
//  Calc
//
//  Created by Alexandr Mefisto on 10.12.2022.
//

import UIKit

class CalcViewController: UIViewController {
    // MARK: - IBOutlets

    //  - LCDDysplay

    @IBOutlet var lcdDisplay: UIView!
    @IBOutlet var displayLabel: UILabel!

    // pin pad buttons

    @IBOutlet var pinpadButton0: UIButton!
    @IBOutlet var pinpadButton1: UIButton!
    @IBOutlet var pinpadButton2: UIButton!
    @IBOutlet var pinpadButton3: UIButton!
    @IBOutlet var pinpadButton4: UIButton!
    @IBOutlet var pinpadButton5: UIButton!
    @IBOutlet var pinpadButton6: UIButton!
    @IBOutlet var pinpadButton7: UIButton!
    @IBOutlet var pinpadButton8: UIButton!
    @IBOutlet var pinpadButton9: UIButton!
    @IBOutlet var decimalButton: UIButton!

    //  operations

    @IBOutlet var equalButton: UIButton!
    @IBOutlet var divideButton: UIButton!
    @IBOutlet var multiplyButton: UIButton!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var subtractButton: UIButton!

    // extra functions

    @IBOutlet var clearButton: UIButton!
    @IBOutlet var negateButton: UIButton!
    @IBOutlet var persentageButton: UIButton!

    // MARK: - Color Themes

    private var currentTheme: CalculatorTheme {
        ThemeManager.shared.currentTheme
    }

    // MARK: - Calculator Engine

    private var calculatorEngine = CalculatorEngine()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        switch currentTheme.statusBarStyle {
        case .light:
            return .lightContent
        case .dark:
            return .darkContent
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addThemeGestureRecogniser()
        redecotrateView()
    }

    // MARK: Gestures

    private func addThemeGestureRecogniser() {
        let themeGesture = UITapGestureRecognizer(target: self, action: #selector(themeGestureRecogniserDidTap))
        themeGesture.numberOfTapsRequired = 2
        lcdDisplay.addGestureRecognizer(themeGesture)
    }

    @objc private func themeGestureRecogniserDidTap(_ gesture: UITapGestureRecognizer) {
        decorateViewWithNextTheme()
    }

    // MARK: - Decorate

    private func decorateViewWithNextTheme() {
        ThemeManager.shared.moveToTheNextTheme()
        redecotrateView()
    }

    private func redecotrateView() {
        // view colors
        let backgroundColor = UIColor(hex: currentTheme.backgroundColor)
        let diaplayLableColor = UIColor(hex: currentTheme.displayColor)
        // pinpad colors
        let pinpadTintColor = UIColor(hex: currentTheme.pinpadColor)
        let pinpadTitleColor = UIColor(hex: currentTheme.pinpadTitleColor)
        // operations colors
        let operationsTintColor = UIColor(hex: currentTheme.operationColor)
        let operationsTitleColor = UIColor(hex: currentTheme.operationTitleColor)
        // extra func colors
        let extraFunctionsTintColor = UIColor(hex: currentTheme.extraFunctionColor)
        let extraFunctionsTitleColor = UIColor(hex: currentTheme.extraFunctionTitleColor)

        // view setting
        view.backgroundColor = backgroundColor
        lcdDisplay.backgroundColor = .clear
        displayLabel.textColor = diaplayLableColor

        // buttons setting
        decoratePinPad(tintColor: pinpadTintColor, titleColor: pinpadTitleColor)
        decorateOperations(tintColor: operationsTintColor, titleColor: operationsTitleColor)
        decorateExtraFunctions(tintColor: extraFunctionsTintColor, titleColor: extraFunctionsTitleColor)
    }

    private func decorateButton(_ button: UIButton, tintColor: UIColor?, titleColor: UIColor?, isSliced: Bool = false) {
        if isSliced {
            button.setBackgroundImage(UIImage(named: "CircleSliced"), for: .normal)
        } else {
            button.setBackgroundImage(UIImage(named: "Circle"), for: .normal)
        }
        button.tintColor = tintColor
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
    }

    private func decorateExtraFunctions(tintColor: UIColor?, titleColor: UIColor?) {
        decorateButton(clearButton, tintColor: tintColor, titleColor: titleColor)
        decorateButton(negateButton, tintColor: tintColor, titleColor: titleColor)
        decorateButton(persentageButton, tintColor: tintColor, titleColor: titleColor)
    }

    private func decorateOperations(tintColor: UIColor?, titleColor: UIColor?) {
        decorateButton(equalButton, tintColor: tintColor, titleColor: titleColor)
        decorateButton(divideButton, tintColor: tintColor, titleColor: titleColor)
        decorateButton(multiplyButton, tintColor: tintColor, titleColor: titleColor)
        decorateButton(addButton, tintColor: tintColor, titleColor: titleColor)
        decorateButton(subtractButton, tintColor: tintColor, titleColor: titleColor)
    }

    private func decoratePinPad(tintColor: UIColor?, titleColor: UIColor?) {
        decorateButton(pinpadButton0, tintColor: tintColor, titleColor: titleColor, isSliced: true)
        decorateButton(pinpadButton1, tintColor: tintColor, titleColor: titleColor)
        decorateButton(pinpadButton2, tintColor: tintColor, titleColor: titleColor)
        decorateButton(pinpadButton3, tintColor: tintColor, titleColor: titleColor)
        decorateButton(pinpadButton4, tintColor: tintColor, titleColor: titleColor)
        decorateButton(pinpadButton5, tintColor: tintColor, titleColor: titleColor)
        decorateButton(pinpadButton6, tintColor: tintColor, titleColor: titleColor)
        decorateButton(pinpadButton7, tintColor: tintColor, titleColor: titleColor)
        decorateButton(pinpadButton8, tintColor: tintColor, titleColor: titleColor)
        decorateButton(pinpadButton9, tintColor: tintColor, titleColor: titleColor)
        decorateButton(decimalButton, tintColor: tintColor, titleColor: titleColor)
    }

    // MARK: - IBActions

    @IBAction private func clearPressed() {
        calculatorEngine.clearPressed()
        refreshLCDDisplay()
    }

    @IBAction private func negatePressed() {
        calculatorEngine.negatePressed()
        refreshLCDDisplay()
    }

    @IBAction private func percentagePressed() {
        calculatorEngine.percentagePressed()
        refreshLCDDisplay()
    }

    // MARK: - Operations

    @IBAction private func addPressed() {
        calculatorEngine.addPressed()
        refreshLCDDisplay()
    }

    @IBAction private func subtractPressed() {
        calculatorEngine.subtractPressed()
        refreshLCDDisplay()
    }

    @IBAction private func multiplyPressed() {
        calculatorEngine.multiplyPressed()
        refreshLCDDisplay()
    }

    @IBAction private func dividePressed() {
        calculatorEngine.dividePressed()
        refreshLCDDisplay()
    }

    @IBAction private func equalsPressed() {
        calculatorEngine.equalsPressed()
        refreshLCDDisplay()
    }

    // MARK: - Number Input

    @IBAction private func decimalPressed() {
        calculatorEngine.decimalPressed()
        refreshLCDDisplay()
    }

    @IBAction private func numberPressed(_ sender: UIButton) {
        let number = sender.tag
        calculatorEngine.numberPressed(number)
        refreshLCDDisplay()
    }

    // MARK: - refresh LCDDisplay

    private func refreshLCDDisplay() {
        displayLabel.text = calculatorEngine.lcdDisplayText
    }
}
