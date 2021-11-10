//
//  LVCConstraints.swift
//  Milky
//
//  Created by Леонід Шевченко on 09.11.2021.
//

import Foundation
import SnapKit
import UIKit

extension LoginViewController {
    
    func setupLoginViewUI() {
    
    view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        let milkyLabel = UILabel()
        milkyLabel.text = " Milky 🐮"
        milkyLabel.textAlignment = .center
        milkyLabel.textColor = UIColor(red: 96/255, green: 148/255, blue: 176/255, alpha: 0.70)
        milkyLabel.numberOfLines = 0
        milkyLabel.font = UIFont.systemFont(ofSize: 50)
        
        view.addSubview(milkyLabel)
        milkyLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.width.equalTo(300)
            make.top.equalToSuperview().inset(150)
            make.height.equalTo(100)
            
        }

        
        let emailField = UITextField()
        emailField.placeholder = "    Email Address"
        emailField.font = UIFont.systemFont(ofSize: 20)
        emailField.backgroundColor = UIColor(red: 96/255, green: 148/255, blue: 176/255, alpha: 50/255)
        emailField.layer.cornerRadius = 10
        view.addSubview(emailField)
        emailField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(360)
            make.top.equalTo(milkyLabel).inset(100)
            make.height.equalTo(40)
        }
        
        let passwordField = UITextField()
        passwordField.placeholder = "    Password"
        passwordField.font = emailField.font
        passwordField.backgroundColor = emailField.backgroundColor
        passwordField.layer.cornerRadius = 10
        view.addSubview(passwordField)
        passwordField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(360)
            make.top.equalTo(emailField).inset(50)
            make.height.equalTo(40)
            
        }
        
        let loginButton = UIButton()
        loginButton.backgroundColor = UIColor(red: 73/255, green: 166/255, blue: 125/255, alpha: 1)
//        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setTitle("Login", for: .normal)
        loginButton.layer.cornerRadius = 10
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(160)
            make.top.equalTo(passwordField).inset(80)
            make.height.equalTo(40)
        }
        
        
        
        
        let signUpButton = UIButton()
        signUpButton.backgroundColor = UIColor(red: 252/255, green: 149/255, blue: 107/255, alpha: 1)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.layer.cornerRadius = 10
        view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(160)
            make.top.equalTo(loginButton).inset(50)
            make.height.equalTo(40)
        }
        
        let enterAsGuestButton = UIButton()
        enterAsGuestButton.backgroundColor = passwordField.backgroundColor
//        enterAsGuestButton.addTarget(self, action: #selector(enterAsGuestButtonPressed), for: .touchUpInside)
        enterAsGuestButton.setTitleColor(.lightGray, for: .normal)
        enterAsGuestButton.setTitle("Enter as a guest ", for: .normal)
        enterAsGuestButton.layer.cornerRadius = 10
        view.addSubview(enterAsGuestButton)
        enterAsGuestButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(160)
            make.top.equalTo(signUpButton).inset(50)
            make.height.equalTo(40)
        }
    }
    
    
    
}
