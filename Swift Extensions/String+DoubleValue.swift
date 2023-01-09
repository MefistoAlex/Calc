//
//  String+DoubleValue.swift
//  Calc
//
//  Created by Alexandr Mefisto on 05.01.2023.
//

import Foundation

extension String {
    var doubleValue: Double? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.number(from: self)?.doubleValue
    }
}
