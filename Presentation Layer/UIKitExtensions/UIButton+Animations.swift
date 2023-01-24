//
//  UIButton+Animations.swift
//  Calc
//
//  Created by Alexandr Mefisto on 09.01.2023.
//

import UIKit

extension UIButton {
    func bounce() {
        UIView.animate(withDuration: 0.1, delay: 0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 0,
                       options: [.curveEaseIn, .allowUserInteraction]
        ) { [weak self] in
            self?.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        } completion: { _ in
            UIView.animate(withDuration: 0.15,
                           delay: 0,
                           options: [.curveEaseIn, .allowUserInteraction]
            ) { [weak self] in
                self?.transform = .identity
            }
        }
    }
}
