//
//  UIStoryboard+Extensions.swift
//  Calc
//
//  Created by Alexandr Mefisto on 27.01.2023.
//

import UIKit
extension UIStoryboard {
    func instantiateViewController<T: UIViewController>() -> T {
        let identifier = String(describing: T.self)
        guard let viewController = instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(identifier) ")
        }
        return viewController
    }
}
