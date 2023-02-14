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

    // MARK: Constants

    private let decimalSymbol = "."
    private let errorMessage = "Error"

    // MARK: - Math Equation

    private(set) var mathEquation = MathEquation(leftHandSide: .zero)

    // MARK: - LCD Display

    var inputText = ""


    // MARK: - Initialiser

    init() {
        inputText = mathEquation.leftHandSide.description
    }

    // MARK: - Extra Functions

    mutating func negatePressed() {
        switch operandSide {
        case .leftHandSide:
            mathEquation.negateLeftHandSide()
            inputText = mathEquation.leftHandSide.description
        case .rightHandSide:
            mathEquation.negateRightHandSide()
            inputText = mathEquation.rigthHandSide?.description ?? errorMessage
        }
    }

    mutating func percentagePressed() {
        switch operandSide {
        case .leftHandSide:
            mathEquation.applyPersentageToLeftHandSide()
            inputText = mathEquation.leftHandSide.description
        case .rightHandSide:
            mathEquation.applyPersentageToRightHandSide()
            inputText = mathEquation.rigthHandSide?.description ?? errorMessage
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
        inputText = mathEquation.result?.description ?? errorMessage
    }

    mutating func reset() {
        mathEquation = MathEquation(leftHandSide: .zero)
    }

    mutating func resetWithPreviouseResults() {
        mathEquation = MathEquation(leftHandSide: mathEquation.result ?? .zero)
    }

    mutating func repeatLastEquation() {
        mathEquation = MathEquation(
            leftHandSide: mathEquation.result ?? .zero,
            rigthHandSide: mathEquation.rigthHandSide,
            operation: mathEquation.operation
        )
    }

    private mutating func changeOperationSide() {
        operandSide = .rightHandSide
    }

    // MARK: - Number Input

    mutating func decimalPressed() {
        inputText = appendDecimalSeparatorIfNeededToString(inputText)
    }

    private mutating func appendDecimalSeparatorIfNeededToString(_ string: String) -> String {
        if inputText.contains(decimalSymbol) {
            return string
        } else {
            return string + decimalSymbol
        }
    }

    mutating func numberPressed(_ number: Int) {
        guard number >= -9, number <= 9 else { return }

        if isNewOperationValue {
            inputText = String(number)
            isNewOperationValue = false
        } else {
            inputText = appendNumberToString(inputText, number: number)
        }

        let decimalInput = Decimal(string: inputText)!

        switch operandSide {
        case .leftHandSide:
            mathEquation.leftHandSide = decimalInput
        case .rightHandSide:
            mathEquation.rigthHandSide = decimalInput
        }
        inputText = decimalInput.description
    }

    private func appendNumberToString(_ string: String, number: Int) -> String {
        let result = string.appending(String(number))
        return result
    }

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

    // MARK: - Copy & Paste

    mutating func pasteInNumber(_ decimal: Decimal) {
        switch operandSide {
        case .leftHandSide:
            mathEquation.leftHandSide = decimal
        case .rightHandSide:
            mathEquation.rigthHandSide = decimal
        }
        inputText = decimal.description
    }

    func generatePrintout() -> String {
        mathEquation.generatePrintout()
    }
}
