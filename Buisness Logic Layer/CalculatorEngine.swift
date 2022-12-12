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