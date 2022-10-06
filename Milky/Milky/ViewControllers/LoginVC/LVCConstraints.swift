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

        view.addSubview(goToCreateNewAccountButton)
        goToCreateNewAccountButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.top.equalTo(loginButton).inset(50)
            make.height.equalTo(40)
        }

        view.addSubview(enterAsGuestButton)
        enterAsGuestButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(160)
            make.top.equalTo(goToCreateNewAccountButton).inset(50)
            make.height.equalTo(40)
        }

        view.addSubview(cowBell)
        cowBell.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.height.equalTo(150)
            make.topMargin.equalTo(enterAsGuestButton).inset(100)
        }
    }
}
