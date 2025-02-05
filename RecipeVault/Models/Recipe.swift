//
//  Recipe.swift
//  RecipeVault
//
//  Created by Tanpreet Kaur on 2/3/25.
//

import Foundation

struct Recipe: Identifiable, Codable {
    let cuisine: String
    let name: String
    let photo_url_large: String?
    let photo_url_small: String?
    let uuid: String
    let source_url: String?
    let youtube_url: String?
    
    var id: String { uuid }
}
