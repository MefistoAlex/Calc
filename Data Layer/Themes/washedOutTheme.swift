//
//  washedOutTheme.swift
//  Calc
//
//  Created by Alexandr Mefisto on 19.12.2022.
//

import Foundation

extension CalculatorTheme {
    static var washedOutTheme: CalculatorTheme {
        return CalculatorTheme(
            id: "8",
            backgroundColor: "#ECF5FF",
            displayColor: "#0D2A4B",

            extraFunctionColor: "#A3CFF9",
            extraFunctionTitleColor: "#5487BA",

            operationColor: "#A3CFF9",
            operationTitleColor: "#5487BA",
            operationSelectedColor: "#0D2A4B",
            operationTitleSelectedColor: "#ffffff",

            pinpadColor: "#1D1D1D",
            pinpadTitleColor: "#ffffff",

            statusBarStyle: .dark)
    }
}
