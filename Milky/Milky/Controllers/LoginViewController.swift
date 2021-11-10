//
//  ViewController.swift
//  Milky
//
//  Created by Леонід Шевченко on 09.11.2021.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    
    let milkyLabel = UILabel()
    let emailField = UITextField()
    let passwordField = UITextField()
    let loginButton = UIButton()
    let signUpButton = UIButton()
    let enterAsGuestButton = UIButton()

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
            
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        emailField.becomeFirstResponder()

    }
    
    
    @objc func loginButtonPressed(sender: UIButton!) {
        print("loginButtonPressed")
    }
    
//    @objc func signUpButtonPressed(sender: UIButton!) {
//        print("signUpButtonPressed")
//    }
    
    @objc func enterAsGuestButtonPressed(sender: UIButton!) {
        print("enterAsGuestButtonPressed")
    }
    
    
    @objc func signUpButtonPressed(sender: UIButton!) {
        print("Sign Up button tapped ")
        guard let email = emailField.text, !email.isEmpty,
                let password = passwordField.text, !password.isEmpty else {
                    print("Missing field data")
                    return
                }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] result, error in
            guard let strongSelf = self else {
                return
            }
            
            
            guard error == nil else {
                // show account creation
                strongSelf.showCreateAccount(email: email, password: password)
                return
            }
            
            print("You have sign in")
            strongSelf.milkyLabel.isHidden = true
            strongSelf.emailField.isHidden = true
            strongSelf.passwordField.isHidden = true
            strongSelf.loginButton.isHidden = true
            strongSelf.signUpButton.isHidden = true
            strongSelf.enterAsGuestButton.isHidden = true
            
            strongSelf.emailField.resignFirstResponder()
            strongSelf.passwordField.resignFirstResponder()
        })
        
    }
    
    func showCreateAccount(email: String, password: String) {
        let alert = UIAlertController(title: "Create Account",
                                      message: "Would you like to create an account",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue",
                                      style: .default,
                                      handler: {_ in
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: { [weak self] result, error in
                
                guard let strongSelf = self else {
                    return
                }
                
                guard error == nil else {
                    // show account creation
                    print("Account creation failed")
                    return
                }
                
                print("You have sign in")
                strongSelf.milkyLabel.isHidden = true
                strongSelf.emailField.isHidden = true
                strongSelf.passwordField.isHidden = true
                strongSelf.loginButton.isHidden = true
                strongSelf.signUpButton.isHidden = true
                strongSelf.enterAsGuestButton.isHidden = true
                
                strongSelf.emailField.resignFirstResponder()
                strongSelf.passwordField.resignFirstResponder()
            })
        }))
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel,
                                      handler: {_ in
            
        }))
        
        present(alert, animated: true)
    }
    
    // get auth instance
    // attempt sign in
    // if failure, present alert to create account (OR send an arror)
    // if user continues, create account
    
    // check sign in on APP launch
    // allow user to sign upwith button
    
    
   

}

