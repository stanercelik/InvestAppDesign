//
//  TabBarViewController.swift
//  InvestAppDesign
//
//  Created by Taner Çelik on 5.05.2024.
//

import UIKit

class TabBarViewController: UITabBarController {

    @IBOutlet weak var leftButtonItem: UIBarButtonItem!
    
    @IBOutlet weak var rightbuttonItem: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        leftButtonItem.tintColor = .black
        rightbuttonItem.tintColor = .black
        
        self.tabBar.unselectedItemTintColor = .darkGray
        self.tabBar.tintColor = ColorConst().buttonColor
    }
}
