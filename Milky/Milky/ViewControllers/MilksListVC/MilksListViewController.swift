//
//  MilksList.swift
//  Milky
//
//  Created by Леонід Шевченко on 11.11.2021.
//

import Foundation
import FirebaseAuth
import UIKit

class MilksListViewController: UIViewController {
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProductCustomTableViewCell.self, forCellReuseIdentifier: ProductCustomTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logOutButtonTapped))

        title = "Products"
    }

    override func viewDidLayoutSubviews() {super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    @objc func logOutButtonTapped() {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            dismiss(animated: true, completion: nil)
        } catch {
            print("An error occurred")
        }
    }
}

extension MilksListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCustomTableViewCell.identifier, for: indexPath)

        return cell
    }
}

extension MilksListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  250
    }

    // Appearing cells animation
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 30, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0
        UIView.animate(withDuration: 0.75) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
    }
}
