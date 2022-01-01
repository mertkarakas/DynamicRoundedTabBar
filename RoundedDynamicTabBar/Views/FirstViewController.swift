//
//  FirstViewController.swift
//  RoundedDynamicTabBar
//
//  Created by Mert Karakas on 1.01.2022.
//

import UIKit

final class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        UILabel().makeCenteredLabel(text: String(describing: self), superView: view)
    }
}
