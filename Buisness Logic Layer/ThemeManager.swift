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

    // MARK: - Data Store

    private let dataStore = DataStoreManager(key: "Mefisto.com.Calc.ThemeManager.savedThemeIndex")

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
        if let previousIndex = dataStore.getValue() as? Int {
            savedThemeIndex = previousIndex
        }

        savedTheme = themes[savedThemeIndex]
    }

    private func saveThemeIndex() {
        dataStore.set(savedThemeIndex)
    }
}
