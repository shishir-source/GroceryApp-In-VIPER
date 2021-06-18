//
//  HomePresenter.swift
//  GroceryViper
//
//  Created by Shishir Ahmed on 4/4/21.
//

import Foundation
import UIKit

protocol HomePresentation {
    func viewDidLoad() -> Void
    func didTapSelected(usingCategory category: CategoryViewModel) -> (Void)
}

class HomePresenter {
    
    weak var view: HomeView?
    var router: HomeRouting?
    
    typealias UseCase = (
        getCategories: (_ success: @escaping (CategoriesClosure), _ failure: @escaping (ErrorClosure) ) -> Void,
        getTitle: HomeModel
    )
    var useCase: UseCase?
    
    init(view: HomeView, useCase: HomePresenter.UseCase, router: HomeRouting) {
        self.view = view
        self.useCase = useCase
        self.router = router
    }
    
}

extension HomePresenter: HomePresentation {
    
    func didTapSelected(usingCategory category: CategoryViewModel) {
        router?.gotoDetailsView(usingCategory: category)
    }
    
    func viewDidLoad() {
        
        DispatchQueue.global(qos: .background).async {
            self.useCase?.getCategories (
                { (success,response) in
                    let categoryList = response.compactMap({CategoryViewModel(using: $0)})
                    DispatchQueue.main.async {[weak self] in
                        guard let `self` = self else {return}
                        self.view?.updateCategory(categoryList: categoryList)
                    }
                },
                { (error) in
                    print(error)
                }
                
            )
            
        }
        
        
        let homeModel = self.useCase?.getTitle
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else {return}
            self.view?.updateTitle(title: homeModel!.title)
        }
        
    }
    
}

struct GroceryItemViewModel {
    let id: String
    let title: String
    let image: String
    let price: String
    
    init(using groceryModel: Grocery){
        self.id = groceryModel.id
        self.title =  groceryModel.name
        self.image = groceryModel.image
        self.price = groceryModel.price
    }
}

struct CategoryViewModel {
    let id: String
    let title: String
    let description: String
    let image: String
    
    init(using categoryModel: Category) {
        self.id = categoryModel.id
        self.title = categoryModel.category
        self.description = categoryModel.description
        self.image = categoryModel.img
    }
}
