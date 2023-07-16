//
//  UIViewController+Ext.swift
//  Custom-Keyboard
//
//  Created by Caner Çağrı on 16.07.2023.
//

import UIKit

extension UIViewController {


    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
