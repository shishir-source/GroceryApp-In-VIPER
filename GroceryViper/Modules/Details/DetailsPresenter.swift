//
//  DetailsViewPresenter.swift
//  GroceryViper
//
//  Created by Shishir Ahmed on 6/4/21.
//

import UIKit

protocol DetailsViewPresentation {
    func backButtonPressed()
    func viewDidLoad() -> Void
}

class DetailsViewPresenter {
    
    weak var view: DetailsView?
    var router: DetailsRouting?
    
    typealias UseCase = (
        fetchGroceries: (_ categoryId: String, _ completion: @escaping GroceriesClosure) -> Void,
        getCategory: CategoryViewModel
    )
    
    var useCase: UseCase
    var categoryId: String
    
    init(view: DetailsView, useCase: DetailsViewPresenter.UseCase, router: DetailsRouting, categoryId: String) {
        self.view = view
        self.useCase = useCase
        self.router = router
        self.categoryId = categoryId
    }
}

extension DetailsViewPresenter: DetailsViewPresentation {
    
    func viewDidLoad() {
        
        DispatchQueue.global(qos: .background).async {
            
            self.useCase.fetchGroceries(self.categoryId) { (sucess , result ) in
                DispatchQueue.main.async {
                    self.view?.updateCategory(category: self.useCase.getCategory)
                    let groceries = result.compactMap({GroceryItemViewModel(using: $0)})
                    self.view?.updateGroceries(groceries: groceries)
                }

            }
            
        }
    }
    
    func backButtonPressed() {
        router?.popBack()
    }
}
