//
//  UIViewController+Routing.swift
//  CalcaReborn
//
//  Created by Valentin Cherepyanko on 05/04/2019.
//  Copyright © 2019 Valentin Cherepyanko. All rights reserved.
//

import UIKit

// reference to this abstraction should always be weak
public protocol IRouting: AnyObject {
    func present(module: Module)
    func dismissCurrentViewController()
}

extension UIViewController: IRouting {

    public func present(module: Module) {
        switch module.presentationType {
        case .modally(let modalTransitionStyle, let modalPresentationStyle):
            module.viewController.modalTransitionStyle = modalTransitionStyle
            module.viewController.modalPresentationStyle = modalPresentationStyle
            self.showModal(viewController: module.viewController, animated: true)
        case .pushing:
            self.push(viewController: module.viewController, animated: true)
        }
    }
    
    public func dismissCurrentViewController() {
        self.dismiss(animated: true, completion: nil)
    }
}

private extension UIViewController {

    func push(viewController: UIViewController,
              animated: Bool,
              functionName:  String = #function,
              lineNumber: Int = #line) {

        guard let navigationController = self.navigationController else {
            assertionFailure("There is no navigation controller on this view controller. Check \(functionName):\(lineNumber)")
            return
        }
        
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func showModal(viewController: UIViewController, animated: Bool) {
        self.present(viewController, animated: animated, completion: nil)
    }
}
