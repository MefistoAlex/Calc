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

    private(set) var equationHistoryLog = [MathEquation]()

    // MARK: Constants

    private let decimalSymbol = "."
    private let errorMessage = "Error"

    // MARK: - LCD Display text

    var lcdDisplayText: String {
        formatOutput(intutString: inputController.inputText)
    }

    // MARK: - Extra Functions

    mutating func clearPressed() {
        inputController = MathInputController()
    }

    mutating func negatePressed() {
        resetFromResultIfNeeded()

        inputController.negatePressed()
    }

    mutating func percentagePressed() {
        resetFromResultIfNeeded()

        inputController.percentagePressed()
    }

    // MARK: - Operations

    mutating func addPressed() {
        executeMathInputControllerIfNeeded()

        inputController.addPressed()
    }

    mutating func subtractPressed() {
        executeMathInputControllerIfNeeded()

        inputController.minusPressed()
    }

    mutating func multiplyPressed() {
        executeMathInputControllerIfNeeded()

        inputController.multiplyPressed()
    }

    mutating func dividePressed() {
        executeMathInputControllerIfNeeded()

        inputController.dividePressed()
    }

    mutating func equalsPressed() {
        if inputController.isCompleted {
            inputController.repeatLastEquation()
        }

        executeMathInputControllerIfNeeded()
    }

    // MARK: - Reseting Math input controller

    private mutating func resetFromResultIfNeeded() {
        if inputController.isCompleted {
            inputController.resetWithPreviouseResults()
        }
    }

    private mutating func executeMathInputControllerIfNeeded() {
        if inputController.isReadyToExecute {
            executeMathInputController()
        }
        resetFromResultIfNeeded()
    }

    mutating func executeMathInputController() {
        inputController.execute()
        printEquationToDebugConsole()
        equationHistoryLog.append(inputController.mathEquation)
    }

    // MARK: - Number Input

    mutating func decimalPressed() {
        inputController.decimalPressed()
    }

    mutating func numberPressed(_ number: Int) {
        if inputController.isCompleted {
            inputController = MathInputController()
        }
        inputController.numberPressed(number)
    }

    // MARK: - Debug Console

    private func printEquationToDebugConsole() {
        print("Equation: " + inputController.generatePrintout())
    }

    private mutating func clearHistoryLog() {
        equationHistoryLog = []
    }

    // MARK: - Copy & Paste

    mutating func pasteInNumber(from decimal: Decimal) {
        if inputController.isCompleted {
            inputController = MathInputController()
        }
        inputController.pasteInNumber(decimal)
    }

    mutating func pasteMathEquation(_ equation: MathEquation) {
        guard let result = equation.result else { return }
        inputController = MathInputController()
        pasteInNumber(from: result)
    }

    // MARK: - Text Output Formating

    private func formatOutput(intutString: String) -> String {
        var inputText = intutString
        if inputText == "0" {
            return inputText
        }
        let decimalSymbol = Locale.current.decimalSeparator ?? "."
        let decimal = Decimal(string: inputText) ?? .zero
        var resultString = decimal.stringDescription ?? errorMessage
        let lastSymbol = inputText.popLast()
        if let lastSymbol {
            if String(lastSymbol) == "." {
                return resultString + decimalSymbol
            }
            if String(lastSymbol) == "0" {
                resultString.append(decimalSymbol)
                let strings = inputText.components(separatedBy: ["."])
                for _ in 0 ... strings[1].count {
                    resultString.append("0")
                }
                return resultString
            }
        }
        return resultString
    }
}
