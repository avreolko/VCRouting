//
//  TabBarAssembly.swift
//  VCRoutingDemo
//
//  Created by Valentin Cherepyanko on 09.01.2020.
//  Copyright © 2020 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCRouting

class TestTabBarController: UITabBarController {

}

struct TabBarAssembly {
    func make(with modules: [Module]) -> Module {

        let viewControllers = modules.map { $0.viewController }

        let tb = UITabBarController()
        tb.viewControllers = viewControllers

        return Module(viewController: tb)
    }
}
