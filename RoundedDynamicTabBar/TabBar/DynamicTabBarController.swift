//
//  DynamicTabBarController.swift
//  RoundedDynamicTabBar
//
//  Created by Mert Karakas on 1.01.2022.
//

import Foundation
import UIKit

final class DynamicTabBarController: UITabBarController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let tabBarRadius: CGFloat = 20
        static let shadowRadius: CGFloat = 4.0
        static let shadowOpacity: Float = 0.6
        static let maskedCorners: CACornerMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    // MARK: - Properties
    
    private let tabBarManager = TabBarManager()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.layer.masksToBounds = true
        tabBar.isTranslucent = true
        tabBar.barStyle = .default
        tabBar.backgroundColor = .systemBackground
        
        // Create round and shadow for tabBar
        
        let roundedShadowView = UIView(frame: tabBar.bounds)
        roundedShadowView.backgroundColor = .systemFill
        roundedShadowView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            tabBar.layer.cornerRadius = Constants.tabBarRadius
            roundedShadowView.layer.cornerRadius = Constants.tabBarRadius
            tabBar.layer.maskedCorners = Constants.maskedCorners
            roundedShadowView.layer.maskedCorners = Constants.maskedCorners
        } else {
            var cornerMask = UIRectCorner()
            cornerMask.insert(.topLeft)
            cornerMask.insert(.topRight)
            let path = UIBezierPath(
                roundedRect: view.bounds,
                byRoundingCorners: cornerMask,
                cornerRadii: CGSize(width: Constants.tabBarRadius, height: Constants.tabBarRadius)
            )
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            roundedShadowView.layer.mask = mask
            tabBar.layer.mask = mask
        }
        tabBar.addSubview(roundedShadowView)
        tabBar.sendSubviewToBack(roundedShadowView)
        roundedShadowView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        roundedShadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
        roundedShadowView.layer.shadowRadius = Constants.shadowRadius
        roundedShadowView.layer.shadowColor = UIColor.gray.cgColor
        roundedShadowView.layer.shadowOpacity = Constants.shadowOpacity
        tabBar.clipsToBounds = false
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        
        // Get tabbar items
        viewControllers = tabBarManager.getViewControllersFromJSON()
    }
}
