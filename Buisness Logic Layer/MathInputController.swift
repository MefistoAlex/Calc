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

    private let decimalSymbol = Locale.current.decimalSeparator ?? "."

    // MARK: - Math Equation

    private(set) var mathEquation = MathEquation(leftHandSide: .zero)

    // MARK: - LCD Display

    var lcdDisplayText: String {
        return inputText
    }

    var inputText = ""

    // MARK: - Is new value

    private var isNewOperationValue = true

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
            inputText = mathEquation.rigthHandSide?.description ?? "Error"
        }
    }

    mutating func percentagePressed() {
        switch operandSide {
        case .leftHandSide:
            mathEquation.applyPersentageToLeftHandSide()
            inputText = mathEquation.leftHandSide.description
        case .rightHandSide:
            mathEquation.applyPersentageToRightHandSide()
            inputText = mathEquation.rigthHandSide?.description ?? "Error"
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
        let result = mathEquation.result
        inputText = mathEquation.result?.description ?? "Error"
        mathEquation = MathEquation(leftHandSide: result ?? .zero)
    }

    private mutating func changeOperationSide() {
        operandSide = .rightHandSide
        isNewOperationValue = !isNewOperationValue
    }

    // MARK: - Number Input

    mutating func decimalPressed() {
        inputText = appendDecimalSeparatorIfNeededToString(inputText)
    }

    private mutating func appendDecimalSeparatorIfNeededToString(_ string: String) -> String {
        if inputText.contains(decimalSymbol) {
            return string
        } else {
            isNewOperationValue = false
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

        switch operandSide {
        case .leftHandSide:
            mathEquation.leftHandSide = Decimal(string: inputText, locale: Locale.current)!
        case .rightHandSide:
            mathEquation.rigthHandSide = Decimal(string: inputText, locale: Locale.current)!
        }
    }

    private func appendNumberToString(_ string: String, number: Int) -> String {
        let result = string.appending(String(number))
        return result
    }
}
