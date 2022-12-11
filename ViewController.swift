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

    @IBOutlet var clearButton: UIButton!
    @IBOutlet var negateButton: UIButton!
    @IBOutlet var persentageButton: UIButton!

    @IBOutlet var equalButton: UIButton!
    @IBOutlet var divideButton: UIButton!
    @IBOutlet var multiplyButton: UIButton!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var minusButton: UIButton!

    @IBOutlet var decimalButton: UIButton!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        decotrateView()
    }

    // MARK: - Privates

    private func decotrateView() {
        let backgroundColor: UIColor = .black
        let diaplayLableColor: UIColor = .white
        view.backgroundColor = backgroundColor
        lcdDisplay.backgroundColor = .clear
        displayLabel.textColor = diaplayLableColor
        decoratePinPad()
        decorateOperations()
        decorateExtraFunctions()
    }

    private func decorateButton(_ button: UIButton, tintColor: UIColor, titleColor: UIColor) {
        button.setBackgroundImage(UIImage(named: "Circle"), for: .normal)
        button.tintColor = tintColor
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = .clear
    }

    private func decorateExtraFunctions() {
        let tintColor: UIColor = .lightGray
        let titleColor: UIColor = .white
        decorateButton(clearButton, tintColor: tintColor, titleColor: titleColor)
        decorateButton(negateButton, tintColor: tintColor, titleColor: titleColor)
        decorateButton(persentageButton, tintColor: tintColor, titleColor: titleColor)
    }

    private func decorateOperations() {
        let tintColor: UIColor = .orange
        let titleColor: UIColor = .white
        decorateButton(equalButton, tintColor: tintColor, titleColor: titleColor)
        decorateButton(divideButton, tintColor: tintColor, titleColor: titleColor)
        decorateButton(multiplyButton, tintColor: tintColor, titleColor: titleColor)
        decorateButton(addButton, tintColor: tintColor, titleColor: titleColor)
        decorateButton(minusButton, tintColor: tintColor, titleColor: titleColor)
    }

    private func decoratePinPad() {
        let tintColor: UIColor = .darkGray
        let titleColor: UIColor = .white
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
