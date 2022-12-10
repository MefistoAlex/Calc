//
//  ViewController.swift
//  Calc
//
//  Created by Alexandr Mefisto on 10.12.2022.
//

import UIKit

class ViewController: UIViewController {
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

    override func viewDidLoad() {
        super.viewDidLoad()
        decotrateView()
    }

    private func decotrateView() {
        // pinpad
        decorateButton(pinpadButton0)
        decorateButton(pinpadButton1)
        decorateButton(pinpadButton2)
        decorateButton(pinpadButton3)
        decorateButton(pinpadButton4)
        decorateButton(pinpadButton5)
        decorateButton(pinpadButton6)
        decorateButton(pinpadButton7)
        decorateButton(pinpadButton8)
        decorateButton(pinpadButton9)
        decorateButton(decimalButton)

        // operations
        decorateButton(clearButton)
        decorateButton(negateButton)
        decorateButton(persentageButton)
        decorateButton(equalButton)
        decorateButton(divideButton)
        decorateButton(multiplyButton)
        decorateButton(addButton)
        decorateButton(minusButton)
    }

    private func decorateButton(_ button: UIButton) {
        button.setBackgroundImage(UIImage(named: "Circle"), for: .normal)
        button.tintColor = .orange
        button.backgroundColor = .clear
    }
}
