//
//  ThemeManager.swift
//  Calc
//
//  Created by Alexandr Mefisto on 19.12.2022.
//

import Foundation
final class ThemeManager {
    // MARK: - Singletone

    static let shared = ThemeManager()

    // MARK: - Themes

    private(set) var themes = [CalculatorTheme]()

    private var savedTheme: CalculatorTheme?
    var currentTheme: CalculatorTheme {
        guard let savedTheme else {
            return themes.first ?? CalculatorTheme.darkTheme
        }
        return savedTheme
    }

    private init() {
        populateArrayOfThemes()
    }

    private func populateArrayOfThemes() {
        themes = [
            CalculatorTheme.darkTheme,
            CalculatorTheme.lightBlueTheme,
            CalculatorTheme.pinkTheme,
            CalculatorTheme.purpleTheme,
            CalculatorTheme.darkBlueTheme,
            CalculatorTheme.bloodOrangeTheme,
            CalculatorTheme.electroTheme,
            CalculatorTheme.lightTheme,
            CalculatorTheme.orangeTheme,
            CalculatorTheme.washedOutTheme,
        ]
    }
}
