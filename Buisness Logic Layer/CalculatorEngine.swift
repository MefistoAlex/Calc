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

    // MARK: - LCD Display text

    var lcdDisplayText: String {
        return inputController.lcdDisplayText
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
        if inputController.isReadyToExecute {
            executeMathInputController()
        }
        if inputController.isCompleted {
            inputController.resetWithPreviouseResults()
        }

        inputController.addPressed()
    }

    mutating func subtractPressed() {
        if inputController.isReadyToExecute {
            executeMathInputController()
        }

        if inputController.isCompleted {
            inputController.resetWithPreviouseResults()
        }

        inputController.minusPressed()
    }

    mutating func multiplyPressed() {
        if inputController.isReadyToExecute {
            executeMathInputController()
        }

        if inputController.isCompleted {
            inputController.resetWithPreviouseResults()
        }

        inputController.multiplyPressed()
    }

    mutating func dividePressed() {
        if inputController.isReadyToExecute {
            executeMathInputController()
        }

        if inputController.isCompleted {
            inputController.resetWithPreviouseResults()
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
