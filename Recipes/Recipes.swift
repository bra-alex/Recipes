//
//  Recipes.swift
//  Recipes
//
//  Created by Don Bouncy on 11/11/2022.
//

import Foundation

struct Recipes: Codable, Identifiable{
    let name: String
    let id: Int
    let image: String
    let ingredients: [Ingredients]
    let instructions: [String]
    let servings: String
    let timeTaken: String
    
    struct Ingredients: Codable, Identifiable{
        var id: String
        let title: String
        let ingredients: [String]
        
        enum CodingKeys: String, CodingKey {
            case id = "_id", title, ingredients
        }
    }
}
