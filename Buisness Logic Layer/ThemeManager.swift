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
        loadTheme()
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
        // index of saved theme
        let currentThemeID = currentTheme.id
        let indexOfExistingTheme = themes.firstIndex { calculatorTheme in
            calculatorTheme.id == currentThemeID
        }

        // reset if something wrong
        guard let indexOfExistingTheme else {
            if let firstTheme = themes.first {
                updateSystemWhithTheme(firstTheme)
            }
            return
        }

        // move to the next theme
        var nextThemeIndex = indexOfExistingTheme + 1

        if nextThemeIndex > themes.count - 1 {
            nextThemeIndex = 0
        }
        
        // set theme
        let nextTheme = themes[nextThemeIndex]
        updateSystemWhithTheme(nextTheme)
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

    private func updateSystemWhithTheme(_ theme: CalculatorTheme) {
        savedTheme = theme
        saveThemeToDisk()
    }

    // MARK: - Seva & Load from disk

    private func loadTheme() {
        guard let encodedTheme = dataStore.getValue() as? Data else { return }
        let decoder = JSONDecoder()
        if let decodedTheme = try? decoder.decode(CalculatorTheme.self, from: encodedTheme) {
            savedTheme = decodedTheme
        }
    }

    private func saveThemeToDisk() {
        let encoder = JSONEncoder()
        if let encodedTheme = try? encoder.encode(savedTheme) {
            dataStore.set(encodedTheme)
        }
    }
}
