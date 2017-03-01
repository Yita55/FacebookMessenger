//
//  CustomTabBarController.swift
//  FacebookMessenger
//
//  Created by James Rochabrun on 3/1/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController {
    
    //set up our custom VC's
    override func viewDidLoad() {
        
        let layout = UICollectionViewFlowLayout()
        let friendsVC = FriendsVC(collectionViewLayout: layout)
        let recentMesaggeNavController  = UINavigationController(rootViewController: friendsVC)
        recentMesaggeNavController.tabBarItem.title = "Recent"
        recentMesaggeNavController.tabBarItem.image = #imageLiteral(resourceName: "recent")
    
        viewControllers = [recentMesaggeNavController, dummyNavControllerWith(title: "calls", imageName: "recent"),dummyNavControllerWith(title: "1", imageName: "recent"),dummyNavControllerWith(title: "2", imageName: "recent"),dummyNavControllerWith(title: "3", imageName: "recent"),dummyNavControllerWith(title: "4", imageName: "recent"),dummyNavControllerWith(title: "5", imageName: "recent"),dummyNavControllerWith(title: "6", imageName: "recent"),dummyNavControllerWith(title: "7", imageName: "recent"),dummyNavControllerWith(title: "8", imageName: "recent"),dummyNavControllerWith(title: "9", imageName: "recent"),dummyNavControllerWith(title: "10", imageName: "recent"), ]
    }
    
    
    private func dummyNavControllerWith(title: String, imageName: String) -> UINavigationController {
        
        let vc = UIViewController()
        let navC = UINavigationController(rootViewController: vc)
        navC.tabBarItem.title = title
        navC.tabBarItem.image = UIImage(named: imageName)
        return navC
    }
    
    
    
}
