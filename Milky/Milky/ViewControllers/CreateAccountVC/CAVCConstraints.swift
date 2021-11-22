//
//  CAVCConstraints.swift
//  Milky
//
//  Created by Леонід Шевченко on 18.11.2021.
//

import Foundation
import SnapKit
import UIKit

extension CreateAccountViewController {
    func setupConstraintsForCreateAccountVC() {
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

        view.addSubview(createAccountButton)
        createAccountButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.top.equalTo(passwordField).inset(60)
            make.height.equalTo(60)
        }
    }
}
