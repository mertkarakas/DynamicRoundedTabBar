//
//  TabBarModel.swift
//  RoundedDynamicTabBar
//
//  Created by Mert Karakas on 1.01.2022.
//

public struct TabBarMenuResponse: Codable {
    public let navigation: TabBarNavigationEnum
    public let image: String?
    public let selectedImage: String?
    public let order: Int?
    public let title: String?
}

public enum TabBarNavigationEnum: String, Codable {
    case vc1,
         vc2,
         vc3
}
