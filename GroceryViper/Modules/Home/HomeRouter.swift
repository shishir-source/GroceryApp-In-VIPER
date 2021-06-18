//
//  HomeRouter.swift
//  GroceryViper
//
//  Created by Shishir Ahmed on 4/4/21.
//

import UIKit

protocol HomeRouting {
    func gotoDetailsView(usingCategory category: CategoryViewModel)
}

class HomeRouter {
    
    var viewController: UIViewController
    
    init(view: UIViewController) {
        self.viewController = view
    }
}

extension HomeRouter: HomeRouting {
    
    func gotoDetailsView(usingCategory category: CategoryViewModel) {
        let vc = DetailsModuleBuilder.build(usingCategory: category)
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}
