//
//  AlertView.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 11.09.2022.
//

import UIKit

protocol AlertViewDelegate: AnyObject {
    func didPressOkayButton()
}

class AlertView: UIViewController {
    
    // MARK: - Properties
    private var alert = UIView()
    private var titleLabel = UILabel()
    private var messageLabel = UILabel()
    private var okayButton = UIButton()
    
    weak var delegate: AlertViewDelegate?
    
    var titleString: String?
    var messageString: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    init(titleString: String, messageString: String) {
        super.init(nibName: nil, bundle: nil)
        self.titleString = titleString
        self.messageString = messageString
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

extension AlertView {
        
    // MARK: - setupUI
    private func setupUI() {
        
        // Add ui elements to the parent view
        setupViewHierarchy()
        
        // Setup the constraints of ui elements
        setupConstraints()
        
        // Setup apperances of ui elements
        setupUIApperances()
        
        // Add target to okay button
        okayButton.addTarget(self, action: #selector(didPressOkayButton), for: .touchUpInside)
    }
    
    // MARK: - setupViewHierarchy
    private func setupViewHierarchy() {
        view.addSubview(alert)
        alert.addSubview(titleLabel)
        alert.addSubview(messageLabel)
        alert.addSubview(okayButton)
    }
    
    // MARK: - setupConstraints
    private func setupConstraints() {
        
        alert.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        okayButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            // alert constraints
            alert.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alert.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alert.heightAnchor.constraint(equalToConstant: 300),
            alert.widthAnchor.constraint(equalToConstant: 300),
            
            // title constraints
            titleLabel.topAnchor.constraint(equalTo: alert.topAnchor, constant: 32),
            titleLabel.leftAnchor.constraint(equalTo: alert.leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: alert.rightAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            // Message constraints
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            messageLabel.leftAnchor.constraint(equalTo: alert.leftAnchor, constant: 16),
            messageLabel.rightAnchor.constraint(equalTo: alert.rightAnchor, constant: -16),
            messageLabel.heightAnchor.constraint(equalToConstant: 100),
            
            // Okay button constraints
            okayButton.centerXAnchor.constraint(equalTo: alert.centerXAnchor),
            okayButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 30),
            okayButton.leftAnchor.constraint(equalTo: alert.leftAnchor, constant: 32),
            okayButton.rightAnchor.constraint(equalTo: alert.rightAnchor, constant: -32),
            okayButton.heightAnchor.constraint(equalToConstant: 30)
            
        ])
        
    }
    
    // MARK: - setupUIApperances
    private func setupUIApperances() {
        
        // Background view
        view.backgroundColor = .black.withAlphaComponent(0.8)
        
        // Alert view
        alert.backgroundColor = ThemeManager.colors.backgroundColor!
        alert.layer.masksToBounds = true
        alert.layer.cornerRadius = 8
        
        // Title label
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 22, weight: .semibold)
        titleLabel.text = titleString
        titleLabel.textAlignment = .center
        
        // Message label
        messageLabel.textColor = .white
        messageLabel.font = .systemFont(ofSize: 18, weight: .regular)
        messageLabel.numberOfLines = 0
        messageLabel.text = messageString
        messageLabel.textAlignment = .center
        
        // Okay button
        okayButton.backgroundColor = .white
        okayButton.setTitle("Okay", for: .normal)
        okayButton.setTitleColor(.black, for: .normal)
        okayButton.layer.masksToBounds = true
        okayButton.layer.cornerRadius = 15
        
    }
    
}

// MARK: - @objc methods
extension AlertView {
    
    @objc private func didPressOkayButton() {
        delegate?.didPressOkayButton()
    }
    
}
