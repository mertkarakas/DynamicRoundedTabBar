//
//  UILabel+Extensions.swift
//  RoundedDynamicTabBar
//
//  Created by Mert Karakas on 1.01.2022.
//

import UIKit

extension UILabel {
    func makeCenteredLabel(text: String, superView: UIView) {
        numberOfLines = 0
        self.text = text
        translatesAutoresizingMaskIntoConstraints = false
        superView.addSubview(self)
        
        let labelConstraints: [NSLayoutConstraint] = [
            leftAnchor.constraint(equalTo: superView.leftAnchor, constant: 20),
            rightAnchor.constraint(equalTo: superView.rightAnchor, constant: -20),
            centerXAnchor.constraint(equalTo: superView.centerXAnchor),
            centerYAnchor.constraint(equalTo: superView.centerYAnchor)
        ]
        NSLayoutConstraint.activate(labelConstraints)
    }
}
