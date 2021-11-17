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
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logOutButtonTapped))

        view.backgroundColor = .systemCyan
        title = "Milky products"
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
