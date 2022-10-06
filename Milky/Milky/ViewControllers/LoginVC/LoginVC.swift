//
//  ViewController.swift
//  Milky
//
//  Created by Леонід Шевченко on 09.11.2021.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    // MARK: - Variables
    private lazy var emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,}"
    private lazy var passRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,}$"

    lazy var milkyLabel: UILabel = {
        let value: UILabel = .init()
        value.text = "Milky 🐮"
        value.textAlignment = .center
        value.font = UIFont.systemFont(ofSize: 50, weight: .black)
        value.textColor = ColorsManager.BlueColor
        value.numberOfLines = 0
        return value
    }()

    lazy var cowBell: UIImageView = {
        let value: UIImageView = .init()
        value.image = UIImage(named: "cow-bell")
        return value
    }()

    lazy var emailField: UITextField = {
        let value: UITextField = .init()
        value.placeholder = "Email Address"
        value.font = UIFont.systemFont(ofSize: 20)
        value.backgroundColor = ColorsManager.textFieldColor
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
        value.backgroundColor = ColorsManager.greenColor
        value.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        value.setTitleColor(.white, for: .normal)
        value.setTitle("Login", for: .normal)
        value.layer.cornerRadius = 10
        return value
    }()

    lazy var goToCreateNewAccountButton: UIButton = {
        let value: UIButton = .init()
        value.backgroundColor = ColorsManager.brownColor
        value.addTarget(self, action: #selector(goToCreateNewAccountButtonPressed), for: .touchUpInside)
        value.setTitleColor(.white, for: .normal)
        value.setTitle("Create new account", for: .normal)
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

    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordField.isSecureTextEntry = true

        setupConstraintsForLoginView()
        userLogedInUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if FirebaseAuth.Auth.auth().currentUser == nil {
            emailField.becomeFirstResponder()
        }
    }
    // MARK: - Functions
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

                self.transitionToMLVC()
            }
        }
    }

    @objc func goToCreateNewAccountButtonPressed(sender: UIButton!) {
        print("goToCreateNewAccount button tapped")

        let createAccountVC = UINavigationController(rootViewController: CreateAccountViewController())
        createAccountVC.modalPresentationStyle = .fullScreen
        createAccountVC.modalTransitionStyle = .flipHorizontal
        present(createAccountVC, animated: true)
    }

    @objc func enterAsGuestButtonPressed(sender: UIButton!) {
        print("enterAsGuestButtonPressed")
        transitionToMLVC()
    // MARK: Enter as a guest
    }

    func userLogedInUI() {
        if FirebaseAuth.Auth.auth().currentUser != nil {
            let milkListVC = UINavigationController(rootViewController: MilksListViewController())
            milkListVC.modalPresentationStyle = .fullScreen
            present(milkListVC, animated: false)
        }
    }

    func transitionToMLVC() {
        let milkListVC = UINavigationController(rootViewController: MilksListViewController())
        milkListVC.modalPresentationStyle = .fullScreen
        milkListVC.modalTransitionStyle = .flipHorizontal
        present(milkListVC, animated: true)
    }
}
