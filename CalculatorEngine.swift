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

    // MARK: - Operation Side

    private var operationSide: OperationSide = .leftHandSide

    // MARK: - LCD Display text

    var lcdDisplayText = "0"

    // MARK: - Extra Functions

    mutating func clearPressed() {
    }

    mutating func negatePressed() {
    }

    mutating func percentagePressed() {
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
        lcdDisplayText = mathEquation.result?.description ?? "Error"
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
}
