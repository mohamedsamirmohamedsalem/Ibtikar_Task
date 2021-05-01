//
//  Categories.swift
//  Ibtikar_Task
//
//  Created by mohamed samir on 01/05/2021.
//


import Foundation

// MARK: - CategoriesModel
struct CategoriesModel: Codable {
    let data: CategoryData?
}

// MARK: - DataClass
struct CategoryData: Codable {
    let categories: [Category]?
}

// MARK: - Category
struct Category: Codable {
    let name: String?
}
