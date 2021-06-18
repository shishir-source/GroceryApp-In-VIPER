//
//  DetailsModuleBuilder.swift
//  GroceryViper
//
//  Created by Shishir Ahmed on 6/4/21.
//

import UIKit

class DetailsModuleBuilder {
    static func build(usingCategory category: CategoryViewModel) -> UIViewController{
        let view = DetailsViewController()
        view.title = category.title.uppercased()
        let interactor = DetailsInteractor(service: GroceryService.shared)
        let router = DetailsRouter(view: view)
        let presenter = DetailsViewPresenter(view: view, useCase: (
            fetchGroceries: interactor.getGroceries,
            getCategory: category
        ), router: router, categoryId: category.id)
        view.presenter = presenter
        return view
    }
}
