//
//  MainTabViewController.swift
//  usertestapp
//
//  Created by Hans-Martin Schuller on 16.04.16.
//  Copyright © 2016 hackaburg2016. All rights reserved.
//

import Foundation
import UIKit

class MainTabViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let myVC1 = ExperimentTableViewController(style: .Plain)
        let myVC2 = UIViewController(nibName: nil, bundle: nil)
        let myVC3 = UIViewController(nibName: nil, bundle: nil)
        
//        myVC1.view.backgroundColor = UIColor.blueColor()
//        myVC2.view.backgroundColor = UIColor.redColor()
//        myVC3.view.backgroundColor = UIColor.greenColor()
        
        let controllers = [myVC1,myVC2, myVC3]
        
        let firstImage = UIImage(named: "tabBarIcon")
        let secondImage = UIImage(named: "tabBarIcon")
        myVC1.tabBarItem = UITabBarItem(
            title: "Feed",
            image: firstImage,
            tag: 1)
        myVC2.tabBarItem = UITabBarItem(
            title: "My Experiments",
            image: secondImage,
            tag:2)
        myVC3.tabBarItem = UITabBarItem(title: "Profile", image: firstImage, tag: 3)
        
        self.viewControllers = controllers
        self.title = "TestR"
    }
}