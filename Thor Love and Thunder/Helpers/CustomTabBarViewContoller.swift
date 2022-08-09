//
//  CustomTabBarViewContoller.swift
//  Thor Love and Thunder
//
//  Created by stickerfinger489 on 08/08/2022.
//

import UIKit

class CustomTabBarViewContoller: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.tintColor = UIColor(named: "TabBarTint")!
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
      
        self.tabBar.selectionIndicatorImage = UIImage(named: "Selected")
        self.additionalSafeAreaInsets.bottom = 20
        
    }

}
