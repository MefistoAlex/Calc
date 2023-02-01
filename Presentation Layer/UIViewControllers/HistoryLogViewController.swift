//
//  HistoryLogViewController.swift
//  Calc
//
//  Created by Alexandr Mefisto on 27.01.2023.
//

import UIKit

class HistoryLogViewController: UITableViewController {
    // MARK: - Data source

    var mathEquations = [MathEquation]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        decorateView()
    }

    // MARK: - Navigation Bar

    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonPressed))
    }

    @objc private func doneButtonPressed() {
        dismiss(animated: true)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mathEquations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EquationTableViewCell.self), for: indexPath) as! EquationTableViewCell

        cell.setEquation(mathEquations[indexPath.row])
        let theme = ThemeManager.shared.currentTheme
        cell.decorateFromColorTheme(theme)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let equation = mathEquations[indexPath.row]
        let userInfo = ["Equation": equation]
        NotificationCenter.default.post(name: Notification.Name("Mefisto.com.Calc.LCDDisplay.HistoryLogViewController.pasteMathEquation"), object: nil, userInfo: userInfo)

        dismiss(animated: true)
    }

    // MARK: - Decorate

    private func decorateView() {
        let theme = ThemeManager.shared.currentTheme
        view.backgroundColor = UIColor(hex: theme.backgroundColor)
        view.tintColor = UIColor(hex: theme.displayColor)
        tableView.separatorColor = UIColor(hex: theme.displayColor)
        navigationController?.navigationBar.tintColor = UIColor(hex: theme.displayColor)
        switch theme.statusBarStyle {
        case .light:
            tableView.indicatorStyle = .white
        case .dark:
            tableView.indicatorStyle = .black
        }
    }
}
