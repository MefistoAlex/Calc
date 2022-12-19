//
//  purpleTheme.swift
//  Calc
//
//  Created by Alexandr Mefisto on 19.12.2022.
//

import Foundation

extension CalculatorTheme {
    static var purpleTheme: CalculatorTheme {
        return CalculatorTheme(
            id: "7",
            backgroundColor: "#F4F5FA",
            displayColor: "#1D1D1D",

            extraFunctionColor: "#F4F5FA",
            extraFunctionTitleColor: "#7550FE",

            operationColor: "#7550FE",
            operationTitleColor: "#ffffff",
            operationSelectedColor: "#4566B6",
            operationTitleSelectedColor: "#ffffff",

            pinpadColor: "#1D1D1D",
            pinpadTitleColor: "#ffffff",

            statusBarStyle: .dark)
    }
}
