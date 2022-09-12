//
//  SignUpView.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 11.09.2022.
//

import UIKit

class SignUpView: UIViewController, SignUpContract.signUpView {
    
    // MARK: - Properties
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordAgainLabel: UILabel!
    @IBOutlet weak var passwordAgainTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    var signUpPresenter: SignUpContract.signUpPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        hideKeyboardWhenPressedToSpace()
        
    }

    @IBAction func didPressSignUpButton(_ sender: Any) {
        
    }
    
}

// MARK: - Self related
extension SignUpView {
    
    
    // MARK: - setupUI
    private func setupUI() {
        
        // Set background color
        setBackgroundColor()
        
        // Set email label
        emailLabel.text = "E-mail"
        emailLabel.textColor = .white
        
        // Set email text field
        setEmailTextField()
        
        // Set password label
        passwordLabel.text = "Password"
        passwordLabel.textColor = .white
        
        // Set password text field
        setPasswordTextField()
        
        // Set password again label
        passwordAgainLabel.text = "Password Again"
        passwordAgainLabel.textColor = .white
        
        // Set password again text field
        setPasswordAgainTextField()
        
        // Set sign up button
        setSignUpButton()
    }
    
    /**
     Sets background color as gradient.
     */
    // MARK: - setBackgroundColor
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
     Sets email text field as attributed string.
     */
    // MARK: - setEmailTextField
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
    // MARK: - setPasswordTextField
    private func setPasswordTextField() {
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Enter your password",
                                                                     attributes: [
                                                                        .foregroundColor: ThemeManager.colors.backgroundColor!,
                                                                        .font: UIFont.systemFont(ofSize: 14,
                                                                                                 weight: .regular)
                                                                     ])
        
    }
    
    /**
     Sets password again text field as attributed string.
     */
    // MARK: - setPasswordAgainTextField
    private func setPasswordAgainTextField() {
        
        passwordAgainTextField.attributedPlaceholder = NSAttributedString(string: "Enter your password again",
                                                                     attributes: [
                                                                        .foregroundColor: ThemeManager.colors.backgroundColor!,
                                                                        .font: UIFont.systemFont(ofSize: 14,
                                                                                                 weight: .regular)
                                                                     ])
        
    }
    
    /**
     Sets sign up button as custom.
     */
    // MARK: - setSignUpButton
    private func setSignUpButton() {
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        signUpButton.setTitleColor(ThemeManager.colors.backgroundColor, for: .normal)
        signUpButton.backgroundColor = .white
        signUpButton.layer.borderWidth = 2
        signUpButton.layer.borderColor = UIColor.black.cgColor
        signUpButton.layer.masksToBounds = true
        signUpButton.layer.cornerRadius = signUpButton.frame.height / 4
        
    }
    
    /**
     Hides keyboard after user pressed the space.
     */
    // MARK: - hideKeyboardWhenPressedToSpace
    private func hideKeyboardWhenPressedToSpace() {
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(spaceIsTapped))
        view.addGestureRecognizer(gestureRecognizer)
        
    }
    
}

// Presenter related
extension SignUpView {
    
    // MARK: - displayAlert
    func displayAlert(title: String, message: String) {
        
    }
    
}

// MARK: - @objc functions
extension SignUpView {
    
    @objc private func spaceIsTapped() {
        
        // Hides keyboard after space is tapped by the user.
        view.endEditing(true)
        
    }
    
}
