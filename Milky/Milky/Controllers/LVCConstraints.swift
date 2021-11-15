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
    func setupConstraintsForLoginView() {
    view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)

        view.addSubview(milkyLabel)
        milkyLabel.snp.makeConstraints { make in
        make.leading.trailing.equalToSuperview().inset(30)
        make.width.equalTo(300)
        make.top.equalToSuperview().inset(80)
        make.height.equalTo(100)
        }

        view.addSubview(emailField)
        emailField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(360)
            make.top.equalTo(milkyLabel).inset(100)
            make.height.equalTo(40)
        }

        view.addSubview(passwordField)
        passwordField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(360)
            make.top.equalTo(emailField).inset(50)
            make.height.equalTo(40)
        }

        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(160)
            make.top.equalTo(passwordField).inset(60)
            make.height.equalTo(40)
        }

        view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(160)
            make.top.equalTo(loginButton).inset(50)
            make.height.equalTo(40)
        }

        view.addSubview(enterAsGuestButton)
        enterAsGuestButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(160)
            make.top.equalTo(signUpButton).inset(50)
            make.height.equalTo(40)
        }
    }

    func initiateSignOutButton() {
        logOutButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(80)
            make.bottom.equalToSuperview().inset(40)
            make.height.equalTo(30)
        }
    }

}
