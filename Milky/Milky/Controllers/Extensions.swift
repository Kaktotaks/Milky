//
//  Extensions.swift
//  Milky
//
//  Created by Леонід Шевченко on 15.11.2021.
//

import Foundation
import UIKit

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text ?? "") + string
        let res: String
        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            res = String(text[text.startIndex..<end])
        } else {
            res = text
        }

        checkEmailValidation(email: res)
        checkPasswordValidation(password: res)
        textField.text = res
        return false
    }
}

extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}
