//
//  WelcomeFormViewController.swift
//  Custom-Keyboard
//
//  Created by Caner Çağrı on 16.07.2023.
//

import UIKit

class WelcomeFormViewController: UIViewController {
    
    private let containerView = CKContainerView()
    let titleLabel = CKTitleLabel(textAlignment: .center, fontSize: 18, textColor: .label, text: "WELCOME")
    let amountLabel = CKTextField(placeholder: "Amount", placeHolderSize: 15, cornerRadius: 14)
    let generateQrButton = CKButton(title: "GENERATE QR", color: .systemPink, systemImageName: "qrcode.viewfinder", size: 20)
    private var closeButton = CKCloseButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        applyConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        amountLabel.text = ""
        view.endEditing(true)
    }
    
    private func configureViewController() {
        containerView.setBackgroundColor()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        view.frame = UIScreen.main.bounds
        amountLabel.keyboardType = UIKeyboardType.numberPad
        hideKeyboardWhenTappedAround()
        

        closeButton.addTarget(self, action: #selector(dismissVc), for: .touchUpInside)
        generateQrButton.addTarget(self, action: #selector(generateQrButtonTapped), for: .touchUpInside)
    }
    
    @objc func generateQrButtonTapped() {

    }
    
    @objc func dismissVc() {
        dismiss(animated: true)
    }
    
    func animateIn() {
        self.containerView.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height)
        self.view.alpha = 0
        
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn) {
            self.containerView.transform = .identity
            self.view.alpha = 1
        }
    }
    
    private func applyConstraints() {
        animateIn()
        view.addSubview(containerView)
        
        let totalWidth = view.frame.width
        let textFieldWidth = totalWidth / 1.5
        
        containerView.addSubviews(titleLabel, amountLabel, generateQrButton, closeButton)
        
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.82).isActive = true
        containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.28).isActive = true
        
        closeButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 2).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 2).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        generateQrButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        generateQrButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 25).isActive = true
        generateQrButton.widthAnchor.constraint(equalToConstant: textFieldWidth).isActive = true
        generateQrButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        amountLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        amountLabel.bottomAnchor.constraint(equalTo: generateQrButton.topAnchor, constant: -10).isActive = true
        amountLabel.widthAnchor.constraint(equalToConstant: textFieldWidth ).isActive = true
        amountLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
