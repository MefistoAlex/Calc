//
//  lightBlueTheme.swift
//  Calc
//
//  Created by Alexandr Mefisto on 19.12.2022.
//

import Foundation

extension CalculatorTheme {
    static var lightBlueTheme: CalculatorTheme {
        return CalculatorTheme(
            id: "4",
            backgroundColor: "#F8F8F8",
            displayColor: "#000000",

            extraFunctionColor: "#D6DEE5",
            extraFunctionTitleColor: "#00B4FF",

            operationColor: "#00B4FF",
            operationTitleColor: "#ffffff",
            operationSelectedColor: "#0265FF",
            operationTitleSelectedColor: "#ffffff",

            pinpadColor: "#EEEEEE",
            pinpadTitleColor: "#000000",

            statusBarStyle: .dark)
    }
}
