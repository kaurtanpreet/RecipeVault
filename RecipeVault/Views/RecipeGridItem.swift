//
//  RecipeGridItem.swift
//  RecipeVault
//
//  Created by Tanpreet Kaur on 2/3/25.
//

import SwiftUI

struct RecipeGridItem: View {
    
    let recipe: Recipe
    
    var body: some View {
        VStack {
            ImageView(urlString: recipe.photo_url_small)
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 200, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .background(RoundedRectangle(cornerRadius: 12).fill(Color(.gray.opacity(0.2))))
                .shadow(color: .brown, radius: 2)
                .overlay(alignment: .topLeading) {
                    Text(recipe.cuisine)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                        .shadow(color: .black, radius: 3)
                }
            
            Text(recipe.name)
                .foregroundStyle(.brown)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 150)
            
        }
        .padding()
        
    }
    
}

#Preview {
    
    let id = ""
    let name = "Apam Balik"
    let cuisine = "Malaysian"
    let smallurl = "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg"
    
    RecipeGridItem(recipe: Recipe(cuisine: cuisine, name: name, photo_url_large: nil, photo_url_small: smallurl, uuid: id, source_url: nil, youtube_url: nil))
}
