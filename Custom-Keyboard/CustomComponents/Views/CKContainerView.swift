//
//  CKContainerView.swift
//  Custom-Keyboard
//
//  Created by Caner Çağrı on 16.07.2023.
//

import UIKit

class CKContainerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        layer.cornerRadius = 16
        layer.borderWidth = 2
        layer.borderColor = UIColor.label.cgColor
    }
}
