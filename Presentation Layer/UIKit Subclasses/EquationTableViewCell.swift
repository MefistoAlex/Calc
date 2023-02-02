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
    @IBOutlet var tickImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        tickImage.alpha = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            tickAnimation()
        }
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
        selectedBackgroundView = UIView()
        selectedBackgroundView?.backgroundColor = UIColor(hex: theme.operationColor)
        lshLabel.highlightedTextColor = UIColor(hex: theme.backgroundColor)
        rhsLabel.highlightedTextColor = UIColor(hex: theme.backgroundColor)
        resultLabel.highlightedTextColor = UIColor(hex: theme.backgroundColor)
        tickImage.tintColor = UIColor(hex: theme.backgroundColor)
        tintColor = UIColor(hex: theme.displayColor)
    }

    // MARK: - Animationc

    private func tickAnimation() {
        UIView.animate(withDuration: 0.25, delay: 0, options: []) { [weak self] in
            self?.tickImage.alpha = 1
            self?.tickImage.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        } completion: { [weak self] _ in
            UIView.animate(withDuration: 0.25, delay: 0, options: []) { [weak self] in
                self?.tickImage.transform = .identity
            }
        }
    }
}
