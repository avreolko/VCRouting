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
    
    static let defaultModal = PresentationType.modal(.crossDissolve, .overCurrentContext)
}

public struct Module {
    let viewController: UIViewController
    var presentationType: PresentationType = .defaultModal
}
