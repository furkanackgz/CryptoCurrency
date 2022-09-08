//
//  ViewController.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 6.09.2022.
//

import UIKit

class LoginView: UIViewController, LoginContract.loginView {
    
    // MARK: Properties
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    var loginPresenter: LoginContract.loginPresenter?
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginPresenter?.viewDidLoad()
    }
    
    /// Hide navigation bar
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    // Show navigation bar
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func didPressLoginButton(_ sender: Any) {
        
        // Check for whether both email and password text
        // fields are entered.
        if let email = emailTextField.text, email != "" {
            
            if let password = passwordTextField.text, password != "" {
                
                // If both email and password are given then
                // send it to presenter layer.
                loginPresenter?.didPressLoginButton(email, password)
                
            } else {
                
                displayAlertView(with: "You didn't enter password!",
                                 and: "For login you need to enter both email and password.")
                
            }
            
        } else {
            
            displayAlertView(with: "You didn't enter Email!",
                             and: "For login you need to enter both email and password.")
            
        }
        
        
        
    }
    
    
    @IBAction func didPressSignUpButton(_ sender: Any) {
    }
    
}

// MARK: - Self related
extension LoginView {
    
    /**
     Sets background color as gradient.
     */
    private func setBackgroundColor() {
        
        let colorTop = ThemeManager.colors.backgroundColor!
        let colorBottom = UIColor.black
        
        let gl = CAGradientLayer()
        
        gl.frame = view.bounds
        gl.colors = [colorTop.cgColor, colorBottom.cgColor]
        view.layer.insertSublayer(gl, at: 0)
        containerView.backgroundColor = .clear
        
    }
    
    /**
     Sets image view.
     */
    private func setImageView() {
        
        imageView.image = UIImage(named: "cryptoCurrencyImage")
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.white.cgColor
        
    }
    
    /**
     Sets email text field as attributed string.
     */
    private func setEmailTextField() {
        
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Enter your e-mail address",
                                                                  attributes: [
                                                                    .foregroundColor: ThemeManager.colors.backgroundColor!,
                                                                    .font: UIFont.systemFont(ofSize: 14,
                                                                                             weight: .regular)
                                                                  ])
        
    }
    
    /**
     Sets password text field as attributed string.
     */
    private func setPasswordTextField() {
        
        passwordTextField.placeholder = "Please enter password"
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Enter your password",
                                                                     attributes: [
                                                                        .foregroundColor: ThemeManager.colors.backgroundColor!,
                                                                        .font: UIFont.systemFont(ofSize: 14,
                                                                                                 weight: .regular)
                                                                     ])
        
    }
    
    /**
     Sets login button as custom.
     */
    private func setLoginButton() {
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        loginButton.setTitleColor(ThemeManager.colors.backgroundColor, for: .normal)
        loginButton.backgroundColor = .white
        loginButton.layer.borderWidth = 2
        loginButton.layer.borderColor = UIColor.black.cgColor
        loginButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = loginButton.frame.height / 4
        
    }
    
    /**
     Hides keyboard after user pressed the space.
     */
    private func hideKeyboardWhenPressedToSpace() {
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(spaceIsTapped))
        view.addGestureRecognizer(gestureRecognizer)
        
    }
    
}

// MARK: - Presenter related
extension LoginView {
    
    func setupUI() {
        
        setBackgroundColor()
        
        setImageView()
        
        // Set email label
        emailLabel.text = "E-mail"
        emailLabel.textColor = .white
        
        setEmailTextField()
        
        // Set password label
        passwordLabel.text = "Password"
        passwordLabel.textColor = .white
        
        setPasswordTextField()
        
        setLoginButton()
        
        // Set sign up button
        signUpButton.setTitle("Don't have an account?", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        
        hideKeyboardWhenPressedToSpace()
        
    }
    
    func displayAlertView(with title: String, and message: String) {
        print("title: \(title), message: \(message)")
    }
    
}

// MARK: - @objc functions
extension LoginView {
    
    @objc private func spaceIsTapped() {
        
        // Hides keyboard after space is tapped by the user.
        view.endEditing(true)
        
    }
    
}
