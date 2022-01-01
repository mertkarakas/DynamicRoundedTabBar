//
//  TabBarManager.swift
//  RoundedDynamicTabBar
//
//  Created by Mert Karakas on 1.01.2022.
//

import UIKit

class TabBarManager {
    
    // MARK: - Properties
    
    var tabBarItems = [TabBarMenuResponse]()
    
    // MARK: - init
    
    init() {}
    
    func getViewControllersFromJSON() -> [UIViewController] {
        tabBarItems = Bundle.main.decode(type: [TabBarMenuResponse].self, from: "TabBar.json")
        let viewControllers = tabBarItems
            .sorted { $0.order ?? 0 < $1.order ?? 0 }
            .compactMap { toViewController(for: $0) }
        return viewControllers
    }
    
    // Create TabBar Item and return with associated view controller.
    private func toViewController(for item: TabBarMenuResponse) -> UIViewController? {
        let tabBarItem = UITabBarItem(
            title: item.title,
            image: UIImage(systemName: item.image ?? "note"),
            selectedImage: UIImage(systemName: item.selectedImage ?? "note")
        )
        tabBarItem.tag = item.order ?? 0
        
        // Set up navigation for controller

        let viewController: UIViewController?

        switch item.navigation {
        case .vc1:
            viewController = FirstViewController()
        case .vc2:
            viewController = SecondViewController()
        case .vc3:
            viewController = ThirdViewController()
        }
        
        viewController?.tabBarItem = tabBarItem
        return viewController
    }
}

// Decode json from file
extension Bundle {
    func decode<T: Codable>(type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
