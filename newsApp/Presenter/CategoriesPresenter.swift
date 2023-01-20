//
//  CategoriesPresenter.swift
//  newsApp
//
//  Created by Hastomi Riduan Munthe on 18/01/23.
//

import Foundation

class MainViewModel {
    
   private let categories = ["Business", "Entertainment", "General", "Health", "Science", "Sport", "Technology"]
    
    func loadCategories(didLoadCategories: @escaping (([String]) -> Void)) {
        didLoadCategories(categories)
    }
}
