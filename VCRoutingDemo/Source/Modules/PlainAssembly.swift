//
//  PlainAssembly.swift
//  VCRoutingDemo
//
//  Created by Valentin Cherepyanko on 09.01.2020.
//  Copyright © 2020 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCRouting

struct PlainAssembly {
    func make(with color: UIColor) -> Module {
        let viewController = UIViewController()
        viewController.view.backgroundColor = color
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        return Module(viewController: viewController)
    }
}
