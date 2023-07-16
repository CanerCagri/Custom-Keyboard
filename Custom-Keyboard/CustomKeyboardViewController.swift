//
//  CustomKeyboardViewController.swift
//  Custom-Keyboard
//
//  Created by Caner Çağrı on 16.07.2023.
//

import UIKit
import LocalAuthentication

class CustomKeyboardViewController: UIViewController {
    
    private var chatTextField = CKTextField(placeholder: "Send a message", placeHolderSize: 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        setupLayout()
        
    }
    
    func addKeyboardButton() {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        
        let button = UIBarButtonItem(image: UIImage(systemName: "gift.fill"), style: .plain, target: self, action: #selector(yourButtonTapped))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        keyboardToolbar.items = [flexSpace, button]
        chatTextField.inputAccessoryView = keyboardToolbar
    }
    
    @objc func yourButtonTapped() {
        if isFaceIDAvailable() {
            
        } else {
            print("test")
        }
        authenticateWithFaceID()
    }
    
    func isFaceIDAvailable() -> Bool {
        let context = LAContext()
        var error: NSError?
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
    }
    
    func authenticateWithFaceID() {
        let context = LAContext()
        var error: NSError?
        
        // Biyometrik kimlik doğrulama yapılır
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Face ID ile giriş yapmak için cihazınızı tarayın."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                DispatchQueue.main.async {
                    if success {
                        print("Successfull entry")
                    } else {
                        print("Canceled")
                    }
                }
            }
        } else {
            print("Something went wrong. Please try again later.")
        }
    }

    
    func setupLayout() {
        view.addSubview(chatTextField)
        chatTextField.delegate = self
        
        chatTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        chatTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        chatTextField.heightAnchor.constraint(equalToConstant: 90).isActive = true
        chatTextField.widthAnchor.constraint(equalToConstant: 180).isActive = true
    }
}

extension CustomKeyboardViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        addKeyboardButton()
    }
}
