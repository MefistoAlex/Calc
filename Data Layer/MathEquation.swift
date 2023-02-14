//
//  MathEquation.swift
//  Calc
//
//  Created by Alexandr Mefisto on 11.12.2022.
//

import Foundation

struct MathEquation {
    enum OperationType: String {
        case add = "+"
        case subtract = "-"
        case multiply = "*"
        case divide = "/"
    }

    var leftHandSide: Decimal
    var rigthHandSide: Decimal?
    var operation: OperationType?
    var result: Decimal?

    // MARK: - Execution

    var executed: Bool {
        return result != nil
    }

    mutating func execute() {
        guard let rigthHandSide, let operation else { return }

        switch operation {
        case .add:
            result = leftHandSide + rigthHandSide
        case .subtract:
            result = leftHandSide - rigthHandSide
        case .multiply:
            result = leftHandSide * rigthHandSide
        case .divide:
            result = leftHandSide / rigthHandSide
        }
    }

    // MARK: Negate

    mutating func negateLeftHandSide() {
        leftHandSide.negate()
    }

    mutating func negateRightHandSide() {
        rigthHandSide?.negate()
    }

    mutating func negateResult() {
        result?.negate()
    }

    // MARK: Persentage

    mutating func applyPersentageToLeftHandSide() {
        leftHandSide = calculatePersentageValue(leftHandSide)
    }

    mutating func applyPersentageToRightHandSide() {
        rigthHandSide = calculatePersentageValue(rigthHandSide)
    }

    private func calculatePersentageValue(_ decimal: Decimal?) -> Decimal {
        guard let decimal else { return .nan }
        return decimal / 100
    }

    // MARK: - String representation

    func generatePrintout() -> String {
        guard let operation,
              let leftHandSide = leftHandSide.stringDescription,
              let rigthHandSide = rigthHandSide?.stringDescription,
              let result = result?.stringDescription
        else { return "" }
        return "\(leftHandSide) \(operation.rawValue) \(rigthHandSide) = \(result)"
    }
}
