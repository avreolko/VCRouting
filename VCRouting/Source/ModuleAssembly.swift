//
//  ModuleAssembly.swift
//  VCRouting
//
//  Created by Valentin Cherepyanko on 06.01.2020.
//  Copyright © 2020 Valentin Cherepyanko. All rights reserved.
//

import Foundation

public protocol IModuleAssembly {
    func makeModule() -> Module
}
