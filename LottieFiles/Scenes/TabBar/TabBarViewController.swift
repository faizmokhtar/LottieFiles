//
//  TabBarViewController.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 08/03/2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    let homeTabBarItem: UITabBarItem = {
        let view = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill"))
        return view
    }()
    
    let exploreTabBarItem: UITabBarItem = {
        let view = UITabBarItem(
            title: "Explore",
            image: UIImage(systemName: "heart"),
            selectedImage: UIImage(systemName: "heart.fill"))
        return view
    }()
    
    let profileTabBarItem: UITabBarItem = {
        let view = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person.crop.circle"),
            selectedImage: UIImage(systemName: "person.crop.circle.fill"))
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = .App.tabBarFill
        self.tabBar.unselectedItemTintColor = .App.tabBarDefault

        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = homeTabBarItem
        
        let exploreViewController = ExploreViewController()
        let exploreRootViewController = UINavigationController(rootViewController: exploreViewController)
        exploreRootViewController.tabBarItem = exploreTabBarItem
        
        let profileViewController = ProfileViewController()
        profileViewController.tabBarItem = profileTabBarItem
        
        setViewControllers([
            homeViewController,
            exploreRootViewController,
            profileViewController
        ], animated: true)
    }
}
