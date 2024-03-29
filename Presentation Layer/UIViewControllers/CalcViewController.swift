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

    @IBOutlet var lcdDisplay: LCDDisplay!

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
        registerForNotifications()
    }

    // MARK: Gestures

    private func addThemeGestureRecogniser() {
        let themeGesture = UITapGestureRecognizer(target: self, action: #selector(themeGestureRecogniserDidTap))
        themeGesture.numberOfTapsRequired = 2
        lcdDisplay.addGestureRecognizer(themeGesture)
    }

    @objc private func themeGestureRecogniserDidTap(_ gesture: UITapGestureRecognizer) {
        lcdDisplay.prepareToColorThemeUpdate()
        decorateViewWithNextTheme()
    }

    // MARK: - Select Operation Buttons

    private func deselectOperationButtons() {
        selectOperationButton(addButton, isSelected: false)
        selectOperationButton(subtractButton, isSelected: false)
        selectOperationButton(multiplyButton, isSelected: false)
        selectOperationButton(divideButton, isSelected: false)
    }

    private func selectOperationButton(_ button: UIButton, isSelected: Bool) {
        button.tintColor = isSelected ? UIColor(hex: currentTheme.operationSelectedColor) : UIColor(hex: currentTheme.operationColor)
        button.isSelected = isSelected
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
        lcdDisplay.label.textColor = diaplayLableColor

        // buttons setting
        decoratePinPad(tintColor: pinpadTintColor, titleColor: pinpadTitleColor)
        decorateOperations(tintColor: operationsTintColor, titleColor: operationsTitleColor)
        decorateExtraFunctions(tintColor: extraFunctionsTintColor, titleColor: extraFunctionsTitleColor)

        // status bar
        setNeedsStatusBarAppearanceUpdate()
    }

    private func decorateButton(_ button: UIButton, tintColor: UIColor?, titleColor: UIColor?, isSliced: Bool = false) {
        if isSliced {
            button.setBackgroundImage(UIImage(named: "CircleSliced"), for: .normal)
        } else {
            button.setBackgroundImage(UIImage(named: "Circle"), for: .normal)
        }
        button.tintColor = tintColor
        button.setTitleColor(titleColor, for: .normal)
        button.setTitleColor(UIColor(hex: currentTheme
                .operationTitleSelectedColor), for: .selected)
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

    @IBAction private func clearPressed() {
        clearButton.bounce()
        calculatorEngine.clearPressed()
        refreshLCDDisplay()
    }

    @IBAction private func negatePressed() {
        negateButton.bounce()
        calculatorEngine.negatePressed()
        refreshLCDDisplay()
    }

    @IBAction private func percentagePressed() {
        persentageButton.bounce()
        calculatorEngine.percentagePressed()
        refreshLCDDisplay()
    }

    // MARK: - Operations

    @IBAction private func addPressed() {
        addButton.bounce()
        deselectOperationButtons()
        selectOperationButton(addButton, isSelected: true)
        calculatorEngine.addPressed()
        refreshLCDDisplay()
    }

    @IBAction private func subtractPressed() {
        subtractButton.bounce()
        deselectOperationButtons()
        selectOperationButton(subtractButton, isSelected: true)
        calculatorEngine.subtractPressed()
        refreshLCDDisplay()
    }

    @IBAction private func multiplyPressed() {
        multiplyButton.bounce()
        deselectOperationButtons()
        selectOperationButton(multiplyButton, isSelected: true)
        calculatorEngine.multiplyPressed()
        refreshLCDDisplay()
    }

    @IBAction private func dividePressed() {
        divideButton.bounce()
        deselectOperationButtons()
        selectOperationButton(divideButton, isSelected: true)
        calculatorEngine.dividePressed()
        refreshLCDDisplay()
    }

    @IBAction private func equalsPressed() {
        equalButton.bounce()
        deselectOperationButtons()
        calculatorEngine.equalsPressed()
        refreshLCDDisplay()
    }

    // MARK: - Number Input

    @IBAction private func decimalPressed() {
        decimalButton.bounce()
        deselectOperationButtons()
        calculatorEngine.decimalPressed()
        refreshLCDDisplay()
    }

    @IBAction private func numberPressed(_ sender: UIButton) {
        sender.bounce()
        deselectOperationButtons()
        let number = sender.tag
        calculatorEngine.numberPressed(number)
        refreshLCDDisplay()
    }

    // MARK: - refresh LCDDisplay

    private func refreshLCDDisplay() {
        lcdDisplay.label.text = calculatorEngine.lcdDisplayText
    }

    // MARK: - Notification

    private func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(didRecivedPasteNotification), name: Notification.Name("Mefisto.com.Calc.LCDDisplay.pasteNumber"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didRecivedPasteEquationNotification), name: Notification.Name("Mefisto.com.Calc.LCDDisplay.HistoryLogViewController.pasteMathEquation"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didRecivedHistoryLogNotification), name: Notification.Name("Mefisto.com.Calc.LCDDisplay.showHistoryLog"), object: nil)
    }

    @objc private func didRecivedPasteNotification(notification: Notification) {
        guard let doubleValue = notification.userInfo? ["PasteKey"] as? Double else { return }
        pasteNumberIntoCalculator(from: Decimal(doubleValue))
    }

    @objc private func didRecivedPasteEquationNotification(notification: Notification) {
        guard let equation = notification.userInfo? ["Equation"] as? MathEquation else { return }
        pasteMathEquationIntoCalculator(equation)
    }

    @objc private func didRecivedHistoryLogNotification(notification: Notification) {
        presentHistoryLogScreen()
    }

    // MARK: - Copy & Paste

    private func pasteNumberIntoCalculator(from decimal: Decimal) {
        calculatorEngine.pasteInNumber(from: decimal)
        refreshLCDDisplay()
    }

    private func pasteMathEquationIntoCalculator(_ equation: MathEquation) {
        calculatorEngine.pasteMathEquation(equation)
        refreshLCDDisplay()
    }

    // MARK: - History Log Screen

    private func presentHistoryLogScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let historyLogController: HistoryLogViewController = storyboard.instantiateViewController()
        historyLogController.mathEquations = calculatorEngine.equationHistoryLog

        let navigationController = UINavigationController(rootViewController: historyLogController)
        present(navigationController, animated: true)
    }
}
