//
//  BaseViewController.swift
//  Milky
//
//  Created by Леонід Шевченко on 20.07.2022.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    // MARK: - Alerts ❗️
    func showAlertProductAdded() {
        let alert = UIAlertController(title: "Product added to 🛒", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { action in
            print("tapped Ok")
        }))

        present(alert, animated: true)
    }

    func showAlertToCreateAccount() {
    let alert = UIAlertController(
        title: "😩 We are sorry, but you need to create an account to add this product to the basket",
        message: nil,
        preferredStyle: .alert)

        alert.addAction(UIAlertAction(
            title: "Ok",
            style: .cancel,
            handler: { _ in
            print("tapped Ok")
            }
        )
    )
        present(alert, animated: true)
    }
}
