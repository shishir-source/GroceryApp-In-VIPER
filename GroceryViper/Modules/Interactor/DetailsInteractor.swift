//
//  DetailsInteractor.swift
//  GroceryViper
//
//  Created by Shishir Ahmed on 6/4/21.
//

import Foundation

class DetailsInteractor {
    var service: GroceriesAPI
    init(service: GroceriesAPI) {
        self.service = service
    }
}

extension DetailsInteractor{
    
    func getGroceries(categoryId: String, completion: @escaping GroceriesClosure) -> Void {
        self.service.fetchGroceries(categoryId: categoryId) { (success, result) -> (Void) in
            if success == 200 {
                completion(success, result)
            }
        } failure: { (failure) -> (Void) in
            print(failure)
        }

    }
}
