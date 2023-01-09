//
//  CalculatorEngine.swift
//  Calc
//
//  Created by Alexandr Mefisto on 11.12.2022.
//

import Foundation

struct CalculatorEngine {
    // MARK: - Input Controller

    private var inputController = MathInputController()

    // MARK: - History

    private var EquationHistoryLog = [MathEquation]()

    // MARK: - LCD Display text

    var lcdDisplayText: String {
        return inputController.lcdDisplayText
    }

    // MARK: - Extra Functions

    mutating func clearPressed() {
        inputController = MathInputController()
    }

    mutating func negatePressed() {
        inputController.negatePressed()
    }

    mutating func percentagePressed() {
        inputController.percentagePressed()
    }

    // MARK: - Operations

    mutating func addPressed() {
        inputController.addPressed()
    }

    mutating func subtractPressed() {
        inputController.minusPressed()
    }

    mutating func multiplyPressed() {
        inputController.multiplyPressed()
    }

    mutating func dividePressed() {
        inputController.dividePressed()
    }

    mutating func equalsPressed() {
        inputController.execute()
        printEquationToDebugConsole()
        EquationHistoryLog.append(inputController.mathEquation)
        inputController.resetWithPreviouseResults()
    }

    // MARK: - Number Input

    mutating func decimalPressed() {
        inputController.decimalPressed()
    }

    mutating func numberPressed(_ number: Int) {
        inputController.numberPressed(number)
    }

    // MARK: - Debug Console

    private func printEquationToDebugConsole() {
        print("Equation: " + inputController.mathEquation.generatePrintout())
    }

    private mutating func clearHistoryLog() {
        EquationHistoryLog = []
    }

    // MARK: - Copy & Paste

    mutating func pasteInNumber(from decimal: Decimal) {
        if inputController.isCompleted {
            inputController = MathInputController()
        }
        inputController.pasteInNumber(decimal)
    }
}
