//
//  MathEquation.swift
//  Calc
//
//  Created by Alexandr Mefisto on 11.12.2022.
//

import Foundation

struct MathEquation {
    enum OperationType {
        case add
        case subtract
        case multiply
        case divide
    }

    var leftHandSide: Decimal
    var rigthHandSide: Decimal?
    var operation: OperationType?
    var result: Decimal?

    // MARK: - Execution

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
}
