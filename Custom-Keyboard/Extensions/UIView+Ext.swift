//
//  UIView+Ext.swift
//  Custom-Keyboard
//
//  Created by Caner Çağrı on 16.07.2023.
//

import UIKit

extension UIView {
    
    func pinToEdges(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
    func applyShadow(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 0.30
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
    func setBackgroundColor() {
        if #available(iOS 13.0, *) {
            let setColor = traitCollection.userInterfaceStyle == .dark ? Colors.darkModeColor : Colors.lightModeColor
            backgroundColor = setColor
        } else {
            backgroundColor = UIColor.secondarySystemBackground
        }
    }
}

struct Colors {
    static let facebookTitleColor = UIColor.white
    static let facebookBackgroundColor = UIColor(red: 88/255.0, green: 86/255.0, blue: 214/255.0, alpha: 1.0)
    static let darkModeColor = UIColor(red: 28/255, green: 30/255, blue: 33/255, alpha: 1.0)
    static let lightModeColor = UIColor.secondarySystemBackground
    static let pastelBlueColor = UIColor(red: 179/255, green: 229/255, blue: 252/255, alpha: 1.0).cgColor
    static let lightYellowColor = UIColor(red: 255/255, green: 255/255, blue: 178/255, alpha: 1.0)
}
