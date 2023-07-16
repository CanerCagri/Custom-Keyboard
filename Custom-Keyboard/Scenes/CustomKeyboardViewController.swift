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
    
    @objc func giftButtonTapped() {
        if isFaceIDAvailable() {
            authenticateWithFaceID()
        } else {
            // The device does not support Face ID or it is not configured.
        }
        
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
            let reason = "Scan your device to sign in with Face ID."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                DispatchQueue.main.async {
                    if success {
                        self.showWelcomeForm()
                    } else {
                        // Face ID authentication failed or user canceled the process.
                        // You can provide appropriate feedback to the user.
                        print("Canceled")
                    }
                }
            }
        } else {
            // The device does not support Face ID or it is not configured.
        }
    }
    
    func showWelcomeForm() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) { [weak self] in
            let popupVc = WelcomeFormViewController()
            
            popupVc.modalTransitionStyle = .crossDissolve
            popupVc.modalPresentationStyle = .overFullScreen
            self?.present(popupVc, animated: true)
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
    
    func addKeyboardButton() {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        
        let button = UIBarButtonItem(image: UIImage(systemName: "gift.fill"), style: .plain, target: self, action: #selector(giftButtonTapped))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        keyboardToolbar.items = [flexSpace, button]
        chatTextField.inputAccessoryView = keyboardToolbar
    }
}
