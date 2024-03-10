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
    
    // MARK: - Properties
    private let activeColor = UIColor.notes
    private let inactiveColor = UIColor.systemGray5
    private var email: String = "" {
        didSet {
            loginButton.isUserInteractionEnabled = !(email.isEmpty || password.isEmpty)
            loginButton.backgroundColor = !(email.isEmpty || password.isEmpty) ? activeColor : inactiveColor
            loginButton.layer.shadowColor = !(email.isEmpty || password.isEmpty) ? activeColor.cgColor : inactiveColor.cgColor
        }
    }
    private var password: String = "" {
        didSet {
            loginButton.isUserInteractionEnabled = !(email.isEmpty || password.isEmpty)
            loginButton.backgroundColor = !(email.isEmpty || password.isEmpty) ? activeColor : inactiveColor
            loginButton.layer.shadowColor = !(email.isEmpty || password.isEmpty) ? activeColor.cgColor : inactiveColor.cgColor
        }
    }
    
    private let mockEmail = "abc@gmail.com"
    private let mockPassword = "123456"
    
    // MARK: - IBActions
    @IBAction func loginButtonAction(_ sender: UIButton) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        if email.isEmpty {
            makeErrorField(textField: emailTextField)
        }
        
        if password.isEmpty {
            makeErrorField(textField: passwordTextField)
        }
        
        if email == mockEmail,#imageLiteral(resourceName: "simulator_screenshot_7A182A8C-63B0-4291-94E3-70B34958FE94.png")
           password == mockPassword {
            performSegue(withIdentifier: "goToHomePage", sender: sender)
        } else {
            let alert = UIAlertController(title: "Error".localized,
                                          message: "Wrong email or password".localized,
                                          preferredStyle: .alert)
            let action = UIAlertAction(title: "OK".localized, style: .default)
            
            alert.addAction(action)
            present(alert, animated: true)
        }
    }
    @IBAction func signupButtonAction(_ sender: UIButton) {
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoginButton()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.becomeFirstResponder()
    }
    
    // MARK: - Methods
    private func setupLoginButton() {
        // Add shadow
        loginButton.layer.shadowColor = activeColor.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        loginButton.layer.shadowOpacity = 0.7
        loginButton.layer.shadowRadius = 6
        
        // Make the button inactive
        loginButton.isUserInteractionEnabled = false
        loginButton.backgroundColor = inactiveColor
        loginButton.layer.shadowColor = inactiveColor.cgColor
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
                !text.isEmpty else { return }
        switch textField {
        case emailTextField:
            let isValidEmail = check(email: text)
            
            if isValidEmail {
                email = text
                emailIcon.tintColor = inactiveColor
                emailDividerView.backgroundColor = inactiveColor
            } else {
                email = ""
                makeErrorField(textField: textField)
            }
        case passwordTextField:
            let isValidPassword = check(password: text)
            
            if isValidPassword {
                password = text
                passwordIcon.tintColor = inactiveColor
                passwordDividerView.backgroundColor = inactiveColor
            } else {
                password = ""
                makeErrorField(textField: textField)
            }
        default:
            print("Unknown textField")
        }
    }
    
    private func check(email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
    
    private func check(password: String) -> Bool {
        return password.count >= 4
    }
    
    private func makeErrorField(textField: UITextField) {
        switch textField {
        case emailTextField:
            emailIcon.tintColor = activeColor
            emailDividerView.backgroundColor = activeColor
        case passwordTextField:
            passwordIcon.tintColor = activeColor
            passwordDividerView.backgroundColor = activeColor
        default:
            print("Unknown textField")
        }
    }
}

