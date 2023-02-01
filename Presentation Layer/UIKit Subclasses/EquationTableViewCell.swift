//
//  EquationTableViewCell.swift
//  Calc
//
//  Created by Alexandr Mefisto on 27.01.2023.
//

import UIKit

class EquationTableViewCell: UITableViewCell {
    // MARK: - IBOutlets

    @IBOutlet private var lshLabel: UILabel!
    @IBOutlet private var rhsLabel: UILabel!
    @IBOutlet private var resultLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setEquation(_ equation: MathEquation) {
        if let operation = equation.operation?.rawValue,
           let rhs = equation.rigthHandSide?.description,
           let result = equation.result?.description {
            lshLabel.text = equation.leftHandSide.description
            rhsLabel.text = "\(operation) \(rhs)"
            resultLabel.text = "= \(result)"
        }
    }

    // MARK: - Decorate

    func decorateFromColorTheme(_ theme: CalculatorTheme) {
        backgroundColor = UIColor(hex: theme.backgroundColor)
        selectedBackgroundView?.backgroundColor = UIColor(hex: theme.operationColor)
        tintColor = UIColor(hex: theme.displayColor)
    }
}
