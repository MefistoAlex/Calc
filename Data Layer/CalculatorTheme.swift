//
//  CalculatorTheme.swift
//  Calc
//
//  Created by Alexandr Mefisto on 11.12.2022.
//

import Foundation

enum StatusBarStyle: Codable {
    case light
    case dark
}
struct CalculatorTheme: Codable {
    let id: String
    
    let backgroundColor: String
    let displayColor: String
    
    let extraFunctionColor: String
    let extraFunctionTitleColor: String
    
    let operationColor: String
    let operationTitleColor: String
    let operationSelectedColor: String
    let operationTitleSelectedColor: String
    
    let pinpadColor: String
    let pinpadTitleColor: String
    
    let statusBarStyle: StatusBarStyle
}
