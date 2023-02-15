//
//  MathInputController.swift
//  Calc
//
//  Created by Alexandr Mefisto on 12.12.2022.
//

import Foundation

struct MathInputController {
    // MARK: - Operand Editing Side

    enum OperandSide {
        case leftHandSide
        case rightHandSide
    }

    private var operandSide = OperandSide.leftHandSide

    // MARK: - Math Equation

    private(set) var mathEquation = MathEquation(leftHandSide: .zero)

    // MARK: - LCD Display

    var LCDDisplayText = ""

    // MARK: - Is new value

    private var isNewOperationValue = true

    // MARK: - Computed Properties

    var isCompleted: Bool {
        return mathEquation.executed
    }

    var isReadyToExecute: Bool {
        if let _ = mathEquation.rigthHandSide, let _ = mathEquation.operation {
            return true
        } else {
            return false
        }
    }

    // MARK: - Initialiser

    init() {
        LCDDisplayText = mathEquation.leftHandSide.description
    }

    // MARK: - Extra Functions

    mutating func negatePressed() {
        switch operandSide {
        case .leftHandSide:
            mathEquation.negateLeftHandSide()
            LCDDisplayText = mathEquation.leftHandSide.description
        case .rightHandSide:
            mathEquation.negateRightHandSide()
            LCDDisplayText = mathEquation.rigthHandSide?.description ?? Constants.errorMessage
        }
    }

    mutating func percentagePressed() {
        switch operandSide {
        case .leftHandSide:
            mathEquation.applyPersentageToLeftHandSide()
            LCDDisplayText = mathEquation.leftHandSide.description
        case .rightHandSide:
            mathEquation.applyPersentageToRightHandSide()
            LCDDisplayText = mathEquation.rigthHandSide?.description ?? Constants.errorMessage
        }
    }

    // MARK: - Operations

    mutating func addPressed() {
        mathEquation.operation = .add
        changeOperationSide()
    }

    mutating func minusPressed() {
        mathEquation.operation = .subtract
        changeOperationSide()
    }

    mutating func multiplyPressed() {
        mathEquation.operation = .multiply
        changeOperationSide()
    }

    mutating func dividePressed() {
        mathEquation.operation = .divide
        changeOperationSide()
    }

    mutating func execute() {
        mathEquation.execute()
        LCDDisplayText = mathEquation.result?.description ?? Constants.errorMessage
    }

    // MARK: - Reseting

    mutating func reset() {
        mathEquation = MathEquation(leftHandSide: .zero)
        operandSide = .leftHandSide
    }

    mutating func resetWithPreviouseResults() {
        mathEquation = MathEquation(leftHandSide: mathEquation.result ?? .zero)
        operandSide = .leftHandSide
    }

    mutating func repeatLastEquation() {
        mathEquation = MathEquation(
            leftHandSide: mathEquation.result ?? .zero,
            rigthHandSide: mathEquation.rigthHandSide,
            operation: mathEquation.operation
        )
        operandSide = .leftHandSide
    }

    private mutating func changeOperationSide() {
        operandSide = .rightHandSide
        isNewOperationValue = !isNewOperationValue
    }

    // MARK: - Number Input

    // MARK: Decimal input

    mutating func decimalPressed() {
        LCDDisplayText = appendDecimalSeparatorIfNeededToString(LCDDisplayText)
    }

    private mutating func appendDecimalSeparatorIfNeededToString(_ string: String) -> String {
        if LCDDisplayText.contains(Constants.decimalSymbol) {
            return string
        } else {
            isNewOperationValue = false
            return string + Constants.decimalSymbol
        }
    }

    // MARK: Digits input

    mutating func numberPressed(_ number: Int) {
        guard number >= -9, number <= 9 else { return }
        if LCDDisplayText == "0" && number == 0 {
            return
        }
        if isNewOperationValue {
            LCDDisplayText = String(number)
            isNewOperationValue = false
        } else {
            LCDDisplayText = appendNumberToString(LCDDisplayText, number: number)
        }
        let decimalInput = Decimal(string: LCDDisplayText)!

        switch operandSide {
        case .leftHandSide:
            mathEquation.leftHandSide = decimalInput
        case .rightHandSide:
            mathEquation.rigthHandSide = decimalInput
        }
    }

    private func appendNumberToString(_ string: String, number: Int) -> String {
        let result = string.appending(String(number))
        return result
    }

    // MARK: - Copy & Paste

    mutating func pasteInNumber(_ decimal: Decimal) {
        switch operandSide {
        case .leftHandSide:
            mathEquation.leftHandSide = decimal
        case .rightHandSide:
            mathEquation.rigthHandSide = decimal
        }
        isNewOperationValue = false
        LCDDisplayText = decimal.description
    }

    // MARK: - Debug Printing

    func generatePrintout() -> String {
        mathEquation.generatePrintout()
    }
}
