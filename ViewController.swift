//
//  ViewController.swift
//  Calc
//
//  Created by Alexandr Mefisto on 10.12.2022.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlets

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
    // extra functions
    @IBOutlet var clearButton: UIButton!
    @IBOutlet var negateButton: UIButton!
    @IBOutlet var persentageButton: UIButton!
    // operations
    @IBOutlet var equalButton: UIButton!
    @IBOutlet var divideButton: UIButton!
    @IBOutlet var multiplyButton: UIButton!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var minusButton: UIButton!

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

    // MARK: - Privates

    private func decotrateView() {
        //view colors
        let backgroundColor = UIColor(hex: currentTheme.backgroundColor)
        let diaplayLableColor = UIColor(hex: currentTheme.diaplayLableColor)
        //pinpad colors
        let pinpadTintColor = UIColor(hex: currentTheme.pinpadTintColor)
        let pinpadTitleColor = UIColor(hex: currentTheme.pinpadTitleColor)
        // operations colors
        let operationsTintColor = UIColor(hex: currentTheme.operationsTintColor)
        let operationsTitleColor = UIColor(hex: currentTheme.operationsTitleColor)
        //extra func colors
        let extraFunctionsTintColor = UIColor(hex: currentTheme.extraFunctionsTintColor)
        let extraFunctionsTitleColor = UIColor(hex: currentTheme.extraFunctionsTitleColor)

        //view setting
        view.backgroundColor = backgroundColor
        lcdDisplay.backgroundColor = .clear
        displayLabel.textColor = diaplayLableColor
        
        //buttons setting
        decoratePinPad(tintColor: pinpadTintColor, titleColor: pinpadTitleColor)
        decorateOperations(tintColor: operationsTintColor, titleColor: operationsTitleColor)
        decorateExtraFunctions(tintColor: extraFunctionsTintColor, titleColor: extraFunctionsTitleColor)
        
    }

    private func decorateButton(_ button: UIButton, tintColor: UIColor?, titleColor: UIColor?) {
        button.setBackgroundImage(UIImage(named: "Circle"), for: .normal)
        button.tintColor = tintColor
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = .clear
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
        decorateButton(minusButton, tintColor: tintColor, titleColor: titleColor)
    }

    private func decoratePinPad(tintColor: UIColor?, titleColor: UIColor?) {
        decorateButton(pinpadButton0, tintColor: tintColor, titleColor: titleColor)
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
}
