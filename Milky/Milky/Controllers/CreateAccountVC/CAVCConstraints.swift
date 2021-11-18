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
        view.addSubview(emailField)
        emailField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(360)
            make.top.equalToSuperview().inset(200)
            make.height.equalTo(40)
        }

        view.addSubview(firstPasswordField)
        firstPasswordField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(360)
            make.top.equalTo(emailField).inset(50)
            make.height.equalTo(40)
        }

        view.addSubview(secondPasswordField)
        secondPasswordField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(360)
            make.top.equalTo(firstPasswordField).inset(50)
            make.height.equalTo(40)
        }

        view.addSubview(createAccountButton)
        createAccountButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.top.equalTo(secondPasswordField).inset(60)
            make.height.equalTo(60)
        }

    }
}
