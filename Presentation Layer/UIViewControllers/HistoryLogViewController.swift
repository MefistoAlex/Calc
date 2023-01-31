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
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let equation = mathEquations[indexPath.row]
        let userInfo = ["Equation": equation]
        NotificationCenter.default.post(name: Notification.Name("Mefisto.com.Calc.LCDDisplay.HistoryLogViewController.pasteMathEquation"), object: nil, userInfo: userInfo)
        
        dismiss(animated: true)
    }
}
