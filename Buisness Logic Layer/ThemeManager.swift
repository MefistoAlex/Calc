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

    private init() {
        populateArrayOfThemes()
        loadThemeIndex()
    }

    // MARK: - Themes

    private(set) var themes = [CalculatorTheme]()
    private var savedThemeIndex = 0
    private var savedTheme: CalculatorTheme?
    var currentTheme: CalculatorTheme {
        guard let savedTheme else {
            return themes.first ?? CalculatorTheme.darkTheme
        }
        return savedTheme
    }

    // MARK: Next Theme

    func moveToTheNextTheme() {
        savedThemeIndex += 1
        if savedThemeIndex > themes.count - 1 {
            savedThemeIndex = 0
        }

        savedTheme = themes[savedThemeIndex]
        saveThemeIndex()
    }

    // MARK: Array of themes

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

    // MARK: - Seva & Load from disk

    private func loadThemeIndex() {
        if let previousIndex = UserDefaults.standard.object(forKey: "Mefisto.com.Calc.ThemeManager.savedThemeIndex") as? Int {
            savedThemeIndex = previousIndex
        }

        savedTheme = themes[savedThemeIndex]
    }

    private func saveThemeIndex() {
        UserDefaults.standard.set(savedThemeIndex, forKey: "Mefisto.com.Calc.ThemeManager.savedThemeIndex")
    }
}
