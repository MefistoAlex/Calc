//
//  Decimal+toString.swift
//  Calc
//
//  Created by Alexandr Mefisto on 13.02.2023.
//

import Foundation
extension Decimal {
    var stringDescription: String? {
        let numberFormater = NumberFormatter()
        numberFormater.numberStyle = .decimal
        return numberFormater.string(for: self)
    }
}
