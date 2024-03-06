//
//  ViewController.swift
//  LoginScreen
//
//  Created by ozinchenko.dev on 03/03/2024.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailDividerView: UIView!
    @IBOutlet weak var passwordDividerView: UIView!
    @IBOutlet weak var signupLabel: UILabel!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var emailIcon: UIImageView!
    @IBOutlet weak var passwordIcon: UIImageView!
    
    // MARK: - IBActions
    @IBAction func loginButtonAction(_ sender: UIButton) {
    }
    @IBAction func signupButtonAction(_ sender: UIButton) {
    }
    
    
    
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

