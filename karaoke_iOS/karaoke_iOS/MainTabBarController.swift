//
//  MainTabBarController.swift
//  karaoke_iOS
//
//  Created by や on 2018/06/17.
//  Copyright © 2018年 CATK. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.barTintColor = UIColor(red: 1, green: 0.83, blue: 0.39, alpha: 1)
        // Do any additional setup after loading the view.
        self.selectedIndex = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0:
//            self.tabBar.barTintColor = UIColor(red: 1, green: 0.83, blue: 0.39, alpha: 1)
            print("新規幹事")
            break
            
        case 1:
            print("マイページ")
            break
            
        case 2:
            print("入手")
            break
        default:
            break
        }
    }


}
