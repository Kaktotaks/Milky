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
    lazy var tableView: UITableView = {
        let value: UITableView = .init()
        return value
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
//        tableView.delegate = self
//        tableView.dataSource = self

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logOutButtonTapped))

        view.backgroundColor = .white
        title = "Milky products"
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
