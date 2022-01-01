//
//  SecondViewController.swift
//  RoundedDynamicTabBar
//
//  Created by Mert Karakas on 1.01.2022.
//

import UIKit

final class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemIndigo
        UILabel().makeCenteredLabel(text: String(describing: self), superView: view)
    }
}
