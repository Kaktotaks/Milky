//
//  CreateAccountVC.swift
//  Milky
//
//  Created by Леонід Шевченко on 18.11.2021.
//

import UIKit
import FirebaseAuth

class CreateAccountViewController: UIViewController {
    // MARK: - Variables

    private lazy var emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    private lazy var passRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,}$"

    lazy var milkyLabel: UILabel = {
        let value: UILabel = .init()
        value.text = "Milky 🐮"
        value.textAlignment = .center
        value.font = UIFont.systemFont(ofSize: 50, weight: .black)
        value.textColor = UIColor(red: 96/255, green: 148/255, blue: 176/255, alpha: 0.70)
        value.numberOfLines = 0
        return value
    }()

    lazy var emailField: UITextField = {
        let value: UITextField = .init()
        value.placeholder = "Enter your email address"
        value.font = UIFont.systemFont(ofSize: 20)
        value.backgroundColor = UIColor(red: 96/255, green: 148/255, blue: 176/255, alpha: 50/255)
        value.layer.cornerRadius = 10
        value.autocapitalizationType = .none
        value.leftViewMode = .always
        value.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        return value
    }()

    lazy var passwordField: UITextField = {
        let value: UITextField = .init()
        value.placeholder = "Create your password"
        value.font = emailField.font
        value.backgroundColor = emailField.backgroundColor
        value.layer.cornerRadius = 10
        value.autocapitalizationType = .none
        value.leftViewMode = .always
        value.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        return value
    }()

    lazy var createAccountButton: UIButton = {
        let value: UIButton = .init()
        value.backgroundColor = UIColor(red: 215/255, green: 180/255, blue: 149/255, alpha: 1)
        value.addTarget(self, action: #selector(createAccountButtonPressed), for: .touchUpInside)
        value.setTitleColor(.white, for: .normal)
        value.setTitle("Create an account", for: .normal)
        value.layer.cornerRadius = 10
        return value
    }()

    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        emailField.delegate = self
        passwordField.delegate = self

        view.backgroundColor = .white
        title = "Account creation 👀"
        setupConstraintsForCreateAccountVC()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Go Back", style: .plain, target: self, action: #selector(goBackButtonTapped))
    }
    // MARK: - Functions

    @objc private func goBackButtonTapped() {
        do {
            dismiss(animated: true, completion: nil)
        } catch {
            print("An error occurred")
        }
    }

    @objc private func createAccountButtonPressed(sender: UIButton!) {
        print("createAccountButtonPressed")
        guard
            let email = emailField.text,
            let password = passwordField.text,
            !email.isEmpty,
            !password.isEmpty
        else { return }

        Auth.auth().createUser(withEmail: email, password: password) { [weak self]_, error in
            guard let self = self else { return }

            if error == nil {
                print("You have just created a new account. Go back to login.")
                let alert = UIAlertController(
                    title: "Well done 🎉",
                    message: "You have just created a new account. Go back to login.",
                    preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)

//                Auth.auth().signIn(withEmail: email, password: password)

//                if FirebaseAuth.Auth.auth().currentUser != nil {
//                    let milkListVC = UINavigationController(rootViewController: MilksListViewController())
//                    milkListVC.modalPresentationStyle = .fullScreen
//                    self.present(milkListVC, animated: false)
//                }

            } else {
                print(" ❗️Error in createUser: \(error?.localizedDescription ?? "")")
                let alert = UIAlertController(
                    title: "Error in createUser:",
                    message: "\(error?.localizedDescription ?? "")",
                    preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }

    func checkEmailValidation(email: String) {
        if email.matches(emailRegex) {
            emailField.backgroundColor = UIColor(red: 96/255, green: 148/255, blue: 1/255, alpha: 50/255)
        } else if emailField.text == "" {
            emailField.backgroundColor = UIColor(red: 96/255, green: 148/255, blue: 176/255, alpha: 50/255)
        }
    }

    func checkPasswordValidation(password: String) {
        guard password.count >= 6 else {
          return  passwordField.backgroundColor = UIColor(red: 96/255, green: 148/255, blue: 176/255, alpha: 50/255)
        }

        if password.matches(passRegex) {
            passwordField.backgroundColor = UIColor(red: 96/255, green: 148/255, blue: 1/255, alpha: 50/255)
        } else if passwordField.text == "" {
            passwordField.backgroundColor = UIColor(red: 96/255, green: 148/255, blue: 176/255, alpha: 50/255)
        } else {
            passwordField.backgroundColor = .red
        }
    }
}
