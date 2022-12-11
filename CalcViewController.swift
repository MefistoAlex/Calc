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
        CalculatorTheme(
            backgroundColor: "#000000",
            diaplayLableColor: "#FFFFFF",
            pinpadTintColor: "#333333",
            pinpadTitleColor: "#FFFFFF",
            operationsTintColor: "#ff9f0a",
            operationsTitleColor: "#FFFFFF",
            extraFunctionsTintColor: "#a6a6a6",
            extraFunctionsTitleColor: "#FFFFFF"
        )
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        decotrateView()
    }

    // MARK: - Decorate

    private func decotrateView() {
        // view colors
        let backgroundColor = UIColor(hex: currentTheme.backgroundColor)
        let diaplayLableColor = UIColor(hex: currentTheme.diaplayLableColor)
        // pinpad colors
        let pinpadTintColor = UIColor(hex: currentTheme.pinpadTintColor)
        let pinpadTitleColor = UIColor(hex: currentTheme.pinpadTitleColor)
        // operations colors
        let operationsTintColor = UIColor(hex: currentTheme.operationsTintColor)
        let operationsTitleColor = UIColor(hex: currentTheme.operationsTitleColor)
        // extra func colors
        let extraFunctionsTintColor = UIColor(hex: currentTheme.extraFunctionsTintColor)
        let extraFunctionsTitleColor = UIColor(hex: currentTheme.extraFunctionsTitleColor)

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
    }

    @IBAction private func negatePressed() {
    }

    @IBAction private func percentagePressed() {
    }

    // MARK: - Operations

    @IBAction private func addPressed() {
    }

    @IBAction private func minusPressed() {
    }

    @IBAction private func multiplyPressed() {
    }

    @IBAction private func dividePressed() {
    }

    @IBAction private func equalsPressed() {
    }

    // MARK: - Number Input

    @IBAction private func decimalPressed() {
    }

    @IBAction private func numberPressed(_ sender: UIButton) {
    }
}
