//
//  Module.swift
//  CalcaReborn
//
//  Created by Valentin Cherepyanko on 05/04/2019.
//  Copyright © 2019 Valentin Cherepyanko. All rights reserved.
//

import UIKit

public enum PresentationType {

    case modally(UIModalTransitionStyle, UIModalPresentationStyle)
    case pushing
    
    public static let defaultModally = PresentationType.modally(.coverVertical, .fullScreen)
}

public struct Module {

    public let viewController: UIViewController

    public var presentationType: PresentationType = .defaultModally

    public init(viewController: UIViewController) {
        self.viewController = viewController
    }
}
