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
    
    
    let milkyLabel = UILabel()
    let emailField = UITextField()
    let passwordField = UITextField()
    let loginButton = UIButton()
    let signUpButton = UIButton()
    let enterAsGuestButton = UIButton()
    let signOutButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoginViewUI()
        
                if FirebaseAuth.Auth.auth().currentUser != nil {
                    milkyLabel.isHidden = true
                    emailField.isHidden = true
                    passwordField.isHidden = true
                    loginButton.isHidden = true
                    signUpButton.isHidden = true
                    enterAsGuestButton.isHidden = true
                    signOutButton.isHidden = false
                    view.backgroundColor = .green
                    
                    view.addSubview(signOutButton)
                    initiateSignOutButton()
        
                }
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
        
        Auth.auth().signIn(withEmail: email, password: password) {user, error in
            if let error = error, user == nil {
                let alert = UIAlertController(
                    title: "Login Failed",
                    message: error.localizedDescription,
                    preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        print("You have log in")
        
        milkyLabel.isHidden = true
        emailField.isHidden = true
        passwordField.isHidden = true
        loginButton.isHidden = true
        signUpButton.isHidden = true
        enterAsGuestButton.isHidden = true
        signOutButton.isHidden = false
        view.addSubview(signOutButton)
        initiateSignOutButton()
        
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        view.backgroundColor = .green
    }
    
    @objc func signUpButtonPressed(sender: UIButton!) {
        print("Sign Up button tapped ")
        guard
            let email = emailField.text,
            let password = passwordField.text,
            !email.isEmpty,
            !password.isEmpty
        else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { [self]_, error in
            if error == nil {
                print("You have sign in after registration account")
                let alert = UIAlertController(
                    title: "Create new account",
                    message: "You want to continue and create a new account",
                    preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
                
                Auth.auth().signIn(withEmail: email, password: password)
                
                milkyLabel.isHidden = true
                emailField.isHidden = true
                passwordField.isHidden = true
                loginButton.isHidden = true
                signUpButton.isHidden = true
                enterAsGuestButton.isHidden = true
                signOutButton.isHidden = false
                view.addSubview(signOutButton)
                initiateSignOutButton()
                
                emailField.resignFirstResponder()
                passwordField.resignFirstResponder()
                view.backgroundColor = .green
            } else {
                
                print("Error in createUser: \(error?.localizedDescription ?? "")")
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
    
    
    @objc func signOutButtonTapped() {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            
            milkyLabel.isHidden = false
            emailField.isHidden = false
            passwordField.isHidden = false
            loginButton.isHidden = false
            signUpButton.isHidden = false
            enterAsGuestButton.isHidden = false
            view.backgroundColor = .white
            
            signOutButton.removeFromSuperview()
            
        }
        catch {
            print("An error occurred")
        }
    }
}
