//
//  ModuleFactory.swift
//  VCRouting
//
//  Created by Valentin Cherepyanko on 06.01.2020.
//  Copyright © 2020 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCRouting

// This ehum allows to you describe your module input and output
// For example: tab bar module receives on input bunch of other modules to display
// Plain module need some color to show
enum ModuleSeed {
    case tabBar([ModuleSeed])
    case plain(UIColor)
}

protocol IModuleBuildersFactory {
    func makeModuleBuilder(for key: ModuleSeed) -> Maker<Module>
}

public typealias Maker<Value> = () -> Value

struct ModuleBuildersFactory: IModuleBuildersFactory {
    func makeModuleBuilder(for key: ModuleSeed) -> Maker<Module> {
        switch key {
        case .tabBar(let seeds): return {
            let modules = seeds.map { self.makeModuleBuilder(for: $0)() }
            return TabBarAssembly().make(with: modules)
        }
        case .plain(let color): return { PlainAssembly().make(with: color) }
        }
    }
}
