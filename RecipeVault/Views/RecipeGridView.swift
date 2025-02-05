//
//  RecipeGridView.swift
//  RecipeVault
//
//  Created by Tanpreet Kaur on 2/3/25.
//

import SwiftUI

struct RecipeGridView: View {
    let recipes: [Recipe]
    
    private let columns = [
        GridItem(.adaptive(minimum: 150), spacing: 15, alignment: .top)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 15) {
            ForEach(recipes) { recipe in
                RecipeGridItem(recipe: recipe)
            }
        }
        .padding()
        .gridColumnAlignment(.listRowSeparatorTrailing)
    }
}

#Preview {
    
    let id = "0"
    let name = "Apam Balik"
    let cuisine = "Malaysian"
    let smallurl = "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg"
    
    let id2 = "1"
    let name2 = "Apple & Blackberry Crumble"
    let cuisine2 = "British"
    let smallurl2 = "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg"
    
    let id3 = "2"
    let name3 = "Banana Pancakes"
    let cuisine3 = "American"
    let smallurl3 = "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/small.jpg"
    
    let sampleRecipes = [
        Recipe(cuisine: cuisine, name: name, photo_url_large: nil, photo_url_small: smallurl, uuid: id, source_url: nil, youtube_url: nil),
        
        Recipe(cuisine: cuisine2, name: name2, photo_url_large: nil, photo_url_small: smallurl2, uuid: id2, source_url: nil, youtube_url: nil),
        
        Recipe(cuisine: cuisine3, name: name3, photo_url_large: nil, photo_url_small: smallurl3, uuid: id3, source_url: nil, youtube_url: nil)
    ]
    
    RecipeGridView(recipes: sampleRecipes)
}
