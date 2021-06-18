//
//  NavigationBuilder.swift
//  GroceryViper
//
//  Created by Shishir Ahmed on 5/4/21.
//

import Foundation
import UIKit

typealias NavigationFactory = (UIViewController) -> (UINavigationController)

class NavigationBuilder {
    
    static func build(rootView: UIViewController) -> UINavigationController{
        let navigationController = UINavigationController(rootViewController: rootView)
        return navigationController
    }
}
