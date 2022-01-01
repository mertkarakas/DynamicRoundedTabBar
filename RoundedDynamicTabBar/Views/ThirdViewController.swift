//
//  ThirdViewController.swift
//  RoundedDynamicTabBar
//
//  Created by Mert Karakas on 1.01.2022.
//

import UIKit

final class ThirdViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGreen
        UILabel().makeCenteredLabel(text: String(describing: self), superView: view)
    }
}
