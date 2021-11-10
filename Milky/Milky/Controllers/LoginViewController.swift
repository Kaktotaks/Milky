//
//  ViewController.swift
//  Milky
//
//  Created by Леонід Шевченко on 09.11.2021.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoginViewUI()
        
    }
    
    @objc func loginButtonPressed(sender: UIButton!) {
        print("loginButtonPressed")
    }
    
    @objc func enterAsGuestButtonPressed(sender: UIButton!) {
        print("enterAsGuestButtonPressed")
    }


}

