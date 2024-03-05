//
//  ViewController.swift
//  LoginScreen
//
//  Created by ozinchenko.dev on 03/03/2024.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadowToLoginButton()
    }
    
    // MARK: - Methods
    private func addShadowToLoginButton() {
        loginButton.layer.shadowColor = UIColor.loginButton.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        loginButton.layer.shadowOpacity = 0.7
        loginButton.layer.shadowRadius = 6
    }

}

