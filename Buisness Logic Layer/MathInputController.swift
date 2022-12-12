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

    var lcdDisplayText = ""

    // MARK: - Initialiser

    init() {
        lcdDisplayText = mathEquation.leftHandSide.description
    }

    // MARK: - Extra Functions

    mutating func negatePressed() {
        switch operandSide {
        case .leftHandSide:
            mathEquation.negateLeftHandSide()
            lcdDisplayText = mathEquation.leftHandSide.description
        case .rightHandSide:
            mathEquation.negateRightHandSide()
            lcdDisplayText = mathEquation.rigthHandSide?.description ?? "Error"
        }
    }

    mutating func percentagePressed() {
        switch operandSide {
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
        operandSide = .rightHandSide
    }

    mutating func minusPressed() {
        mathEquation.operation = .subtract
        operandSide = .rightHandSide
    }

    mutating func multiplyPressed() {
        mathEquation.operation = .multiply
        operandSide = .rightHandSide
    }

    mutating func dividePressed() {
        mathEquation.operation = .divide
        operandSide = .rightHandSide
    }

    mutating func execute() {
        mathEquation.execute()
        lcdDisplayText = mathEquation.result?.description ?? "Error"
    }

    // MARK: - Number Input

    mutating func decimalPressed() {
    }

    mutating func numberPressed(_ number: Int) {
        let decimalValue = Decimal(number)
        lcdDisplayText = decimalValue.description
        switch operandSide {
        case .leftHandSide:
            mathEquation.leftHandSide = decimalValue
        case .rightHandSide:
            mathEquation.rigthHandSide = decimalValue
        }
    }
}
