//
//  CalculatorEngine.swift
//  Calc
//
//  Created by Alexandr Mefisto on 11.12.2022.
//

import Foundation

struct CalculatorEngine {
    enum OperationSide {
        case leftHandSide
        case rightHandSide
    }

    // MARK: - Math Equation

    private var mathEquation = MathEquation(leftHandSide: .zero)

    // MARK: - History

    private var  EquationHistoryLog = [MathEquation]()

    // MARK: - Operation Side

    private var operationSide: OperationSide = .leftHandSide

    // MARK: - LCD Display text

    var lcdDisplayText = "0"

    // MARK: - Extra Functions

    mutating func clearPressed() {
        mathEquation = MathEquation(leftHandSide: .zero)
        lcdDisplayText = mathEquation.leftHandSide.description
        operationSide = .leftHandSide
    }

    mutating func negatePressed() {
        switch operationSide {
        case .leftHandSide:
            mathEquation.negateLeftHandSide()
            lcdDisplayText = mathEquation.leftHandSide.description
        case .rightHandSide:
            mathEquation.negateRightHandSide()
            lcdDisplayText = mathEquation.rigthHandSide?.description ?? "Error"
        }
    }

    mutating func percentagePressed() {
        switch operationSide {
        case .leftHandSide:
            mathEquation.applyPersentageToLeftHandSide()
            lcdDisplayText = mathEquation.leftHandSide.description
        case .rightHandSide:
            mathEquation.applyPersentageToRightHandSide()
            lcdDisplayText = mathEquation.rigthHandSide?.description ?? "Error"
        }
    }

    // MARK: - Operations

    mutating func addPressed() {
        mathEquation.operation = .add
        operationSide = .rightHandSide
    }

    mutating func subtractPressed() {
        mathEquation.operation = .subtract
        operationSide = .rightHandSide
    }

    mutating func multiplyPressed() {
        mathEquation.operation = .multiply
        operationSide = .rightHandSide
    }

    mutating func dividePressed() {
        mathEquation.operation = .divide
        operationSide = .rightHandSide
    }

    mutating func equalsPressed() {
        mathEquation.execute()
        EquationHistoryLog.append(mathEquation)
        lcdDisplayText = mathEquation.result?.description ?? "Error"
        printEquationToDebugConsole()
    }

    // MARK: - Number Input

    mutating func decimalPressed() {
    }

    mutating func numberPressed(_ number: Int) {
        let decimalNumber = Decimal(number)
        lcdDisplayText = decimalNumber.description
        switch operationSide {
        case .leftHandSide:
            mathEquation.leftHandSide = decimalNumber
        case .rightHandSide:
            mathEquation.rigthHandSide = decimalNumber
        }
    }

    // MARK: - Debug Console

    private func printEquationToDebugConsole() {
        print("Equation: " + mathEquation.generatePrintout())
    }

    private mutating func clearHistoryLog() {
        EquationHistoryLog = []
    }
}
