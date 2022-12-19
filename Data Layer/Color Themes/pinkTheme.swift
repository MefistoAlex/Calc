//
//  pinkTheme.swift
//  Calc
//
//  Created by Alexandr Mefisto on 19.12.2022.
//

import Foundation

extension CalculatorTheme {
    static var pinkTheme: CalculatorTheme {
        return CalculatorTheme(
            id: "5",
            backgroundColor: "#253C5B",
            displayColor: "#EBF0EF",

            extraFunctionColor: "#294666",
            extraFunctionTitleColor: "#EBF0EF",

            operationColor: "#FA569C",
            operationTitleColor: "#EBF0EF",
            operationSelectedColor: "#0265FF",
            operationTitleSelectedColor: "#ffffff",

            pinpadColor: "#16253A",
            pinpadTitleColor: "#EBF0EF",

            statusBarStyle: .light)
    }
}
