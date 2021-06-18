//
//  GroceriesAPI.swift
//  GroceryViper
//
//  Created by Shishir Ahmed on 8/4/21.
//

import Alamofire

typealias CategoriesClosure = (_ message: Int, _ response: [Category]) -> (Void)
typealias GroceriesClosure = (_ message: Int, _ response: [Grocery]) -> (Void)
typealias ErrorClosure = (_ message: String) -> (Void)

protocol GroceriesAPI {
    func fetchCategories(success: @escaping CategoriesClosure, failure: @escaping ErrorClosure ) -> Void
    func fetchGroceries(categoryId: String,  success: @escaping GroceriesClosure, failure: @escaping ErrorClosure ) -> Void
}
