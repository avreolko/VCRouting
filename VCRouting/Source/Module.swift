//
//  Module.swift
//  CalcaReborn
//
//  Created by Valentin Cherepyanko on 05/04/2019.
//  Copyright © 2019 Valentin Cherepyanko. All rights reserved.
//

import UIKit

public enum PresentationType {

    case modal(UIModalTransitionStyle, UIModalPresentationStyle)
    case push
    
    public static let defaultModal = PresentationType.modal(.crossDissolve, .overCurrentContext)
}

public struct Module {

    public let viewController: UIViewController

    public var presentationType: PresentationType = .defaultModal

    public init(viewController: UIViewController) {
        self.viewController = viewController
    }
}
