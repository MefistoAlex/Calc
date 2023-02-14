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
        var inputText = inputController.inputText
        let decimalSymbol = Locale.current.decimalSeparator ?? "."
        let decimal = Decimal(string: inputText) ?? .zero
        let resultString = decimal.stringDescription ?? errorMessage
        
        if let lastSymbol = inputText.popLast() {
            if String(lastSymbol) == "." {
                return resultString + decimalSymbol
            }
        }

        return resultString
    }

    // MARK: - Extra Functions

    mutating func clearPressed() {
        inputController = MathInputController()
    }

    mutating func negatePressed() {
        if inputController.isCompleted {
            inputController.resetWithPreviouseResults()
        }

        inputController.negatePressed()
    }

    mutating func percentagePressed() {
        if inputController.isCompleted {
            inputController.resetWithPreviouseResults()
        }

        inputController.percentagePressed()
    }

    // MARK: - Operations

    mutating func addPressed() {
        if inputController.isCompleted {
            inputController.resetWithPreviouseResults()
        }

        if inputController.isReadyToExecute {
            executeMathInputController()
        }
        inputController.addPressed()
    }

    mutating func subtractPressed() {
        if inputController.isCompleted {
            inputController.resetWithPreviouseResults()
        }

        if inputController.isReadyToExecute {
            executeMathInputController()
        }

        inputController.minusPressed()
    }

    mutating func multiplyPressed() {
        if inputController.isCompleted {
            inputController.resetWithPreviouseResults()
        }

        if inputController.isReadyToExecute {
            executeMathInputController()
        }

        inputController.multiplyPressed()
    }

    mutating func dividePressed() {
        if inputController.isCompleted {
            inputController.resetWithPreviouseResults()
        }

        if inputController.isReadyToExecute {
            executeMathInputController()
        }

        inputController.dividePressed()
    }

    mutating func equalsPressed() {
        if inputController.isCompleted {
            inputController.repeatLastEquation()
        }
        if inputController.isReadyToExecute {
            executeMathInputController()
        }
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
}
