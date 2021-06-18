//
//  HomeModuleBuilder.swift
//  GroceryViper
//
//  Created by Shishir Ahmed on 5/4/21.
//

import UIKit

class HomeModuleBuilder {
    
    static func build(usingNavigationFactory factory: NavigationFactory) -> UIViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        let interactor = HomeInteractor(service: GroceryService.shared)
        let router = HomeRouter(view: view)
        let presenter = HomePresenter(view: view, useCase: (
            getCategories: interactor.getCategories,
            getTitle: interactor.getTitle()
        ), router: router)
        view.presenter = presenter
        return factory(view)
    }
    
}
