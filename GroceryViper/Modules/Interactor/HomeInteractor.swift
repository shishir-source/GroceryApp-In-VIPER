//
//  HomeInteractor.swift
//  GroceryViper
//
//  Created by Shishir Ahmed on 5/4/21.
//

import Foundation

//protocol HomeUseCase {
//    func getTitle() -> HomeModel
//    func getGroceries(completion: GroceriesClosure) -> (Void)
//    func getCategories( success: @escaping CategoriesClosure, failure: @escaping ErrorClosure) -> (Void)
//}
//

class HomeInteractor  {
    var service: GroceriesAPI
    init(service: GroceriesAPI) {
        self.service = service
    }
}

extension HomeInteractor {
    
    func getCategories( success: @escaping CategoriesClosure, failure: @escaping ErrorClosure) -> Void {
        self.service.fetchCategories(success: success, failure: failure)
    }
    
    func getTitle() -> HomeModel {
        return HomeModel(title: "Hello From Viper")
    }
    
}
