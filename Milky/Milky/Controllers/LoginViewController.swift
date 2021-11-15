//
//  ViewController.swift
//  Milky
//
//  Created by Леонід Шевченко on 09.11.2021.
//

import UIKit
import FirebaseAuth
import SnapKit

class LoginViewController: UIViewController {
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
        value.placeholder = "Email Address" // нормальный пробел найти решение по нему
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
        value.placeholder = "Password"
        value.font = emailField.font
        value.backgroundColor = emailField.backgroundColor
        value.layer.cornerRadius = 10
        value.autocapitalizationType = .none
        value.leftViewMode = .always
        value.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        return value
    }()

    lazy var loginButton: UIButton = {
        let value: UIButton = .init()
        value.backgroundColor = UIColor(red: 73/255, green: 166/255, blue: 125/255, alpha: 1)
        value.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        value.setTitleColor(.white, for: .normal)
        value.setTitle("Login", for: .normal)
        value.layer.cornerRadius = 10
        return value
    }()

    lazy var signUpButton: UIButton = {
        let value: UIButton = .init()
        value.backgroundColor = UIColor(red: 252/255, green: 149/255, blue: 107/255, alpha: 1)
        value.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        value.setTitleColor(.white, for: .normal)
        value.setTitle("Sign Up", for: .normal)
        value.layer.cornerRadius = 10
        return value
    }()

    lazy var enterAsGuestButton: UIButton = {
        let value: UIButton = .init()
        value.backgroundColor = passwordField.backgroundColor
        value.addTarget(self, action: #selector(enterAsGuestButtonPressed), for: .touchUpInside)
        value.setTitleColor(.lightGray, for: .normal)
        value.setTitle("Enter as a guest ", for: .normal)
        value.layer.cornerRadius = 10
        return value
    }()

    lazy var logOutButton: UIButton = {
        let value: UIButton = .init()
        value.backgroundColor = .black
        value.addTarget(self, action: #selector(logOutButtonTapped), for: .touchUpInside)
        value.setTitleColor(.white, for: .normal)
        value.setTitle("Log Out", for: .normal)
        value.layer.cornerRadius = 10
        return value
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupConstraintsForLoginView()
        userLogedInUI()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if FirebaseAuth.Auth.auth().currentUser == nil {
            emailField.becomeFirstResponder()
        }
    }

    @objc func loginButtonPressed(sender: UIButton!) {
        print("loginButtonPressed")
        guard
            let email = emailField.text,
            let password = passwordField.text,
            !email.isEmpty,
            !password.isEmpty
        else { return }

        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
            guard let self = self else { return }

            if let error = error, user == nil {
                let alert = UIAlertController(
                    title: " ❌ Login Failed",
                    message: error.localizedDescription,
                    preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
            } else if error == nil, user == user {
                print("You have log in")

            self.self.milkyLabel.isHidden = true
            self.emailField.isHidden = true
            self.passwordField.isHidden = true
            self.loginButton.isHidden = true
            self.signUpButton.isHidden = true
            self.enterAsGuestButton.isHidden = true
            self.logOutButton.isHidden = false
            self.view.addSubview(self.logOutButton)
            self.initiateSignOutButton()

            self.emailField.resignFirstResponder()
            self.passwordField.resignFirstResponder()

            self.view.backgroundColor = .green
            }
        }
    }

    @objc func signUpButtonPressed(sender: UIButton!) {
        print("Sign Up button tapped")
        guard
            let email = emailField.text,
            let password = passwordField.text,
            !email.isEmpty,
            !password.isEmpty
        else { return }

        Auth.auth().createUser(withEmail: email, password: password) { [weak self]_, error in
            guard let self = self else { return }

            if error == nil {
                print("You have sign in after registration account")
                let alert = UIAlertController(
                    title: "Well done 🎉",
                    message: "You have just created a new account and already loged in.",
                    preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)

            Auth.auth().signIn(withEmail: email, password: password)

            self.milkyLabel.isHidden = true
            self.emailField.isHidden = true
            self.passwordField.isHidden = true
            self.loginButton.isHidden = true
            self.signUpButton.isHidden = true
            self.enterAsGuestButton.isHidden = true
            self.logOutButton.isHidden = false
            self.view.addSubview(self.logOutButton)
            self.initiateSignOutButton()

            self.emailField.resignFirstResponder()
            self.passwordField.resignFirstResponder()
            self.view.backgroundColor = .green
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

    @objc func enterAsGuestButtonPressed(sender: UIButton!) {
        print("enterAsGuestButtonPressed")
    }

    @objc func logOutButtonTapped() {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            milkyLabel.isHidden = false
            emailField.isHidden = false
            passwordField.isHidden = false
            loginButton.isHidden = false
            signUpButton.isHidden = false
            enterAsGuestButton.isHidden = false
            view.backgroundColor = .white
            logOutButton.removeFromSuperview()
        } catch {
            print("An error occurred")
        }
    }

    private func userLogedInUI() {
        if FirebaseAuth.Auth.auth().currentUser != nil {
            milkyLabel.isHidden = true
            emailField.isHidden = true
            passwordField.isHidden = true
            loginButton.isHidden = true
            signUpButton.isHidden = true
            enterAsGuestButton.isHidden = true
            logOutButton.isHidden = false
            view.backgroundColor = .green

            view.addSubview(logOutButton)
            initiateSignOutButton()
        }
    }
}
