//
//  ModuleIO.swift
//  VCRouting
//
//  Created by Valentin Cherepyanko on 06.01.2020.
//  Copyright © 2020 Valentin Cherepyanko. All rights reserved.
//

import Foundation

public struct None { }

public struct ModuleIO<InputData: Any, OutputData: Any> {

    let inputData: InputData
    let outputHandler: (OutputData) -> Void

    init(inputData: InputData, outputHandler: @escaping (OutputData) -> Void = { _ in }) {
        self.inputData = inputData
        self.outputHandler = outputHandler
    }
}
