//
//  DetailsRouter.swift
//  GroceryViper
//
//  Created by Shishir Ahmed on 6/4/21.
//

import UIKit

protocol DetailsRouting {
    func popBack()
}

class DetailsRouter {
    var viewController: UIViewController
    
    init(view: UIViewController) {
        self.viewController = view
    }
}
extension DetailsRouter: DetailsRouting {
    func popBack() {
        viewController.navigationController?.popViewController(animated: true)
    }
    
    
}
