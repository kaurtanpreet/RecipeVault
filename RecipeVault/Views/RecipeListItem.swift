//
//  RecipeListItem.swift
//  RecipeVault
//
//  Created by Tanpreet Kaur on 2/3/25.
//

import SwiftUI

struct RecipeListItem: View {
    let recipe: Recipe
    
    var body: some View {
        HStack {
            ImageView(urlString: recipe.photo_url_small)
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .background(RoundedRectangle(cornerRadius: 12).fill(Color(.gray.opacity(0.2))))
                .shadow(color: .brown, radius: 2)
            
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .foregroundStyle(.brown)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .padding(.leading,10)
                
                Text(recipe.cuisine)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
                    .padding(.leading, 10)
            }
        }
    }
}

#Preview {
    
    let id = ""
    let name = "Apam Balik"
    let cuisine = "Malaysian"
    let smallurl = "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg"
    
    RecipeListItem(recipe: Recipe(cuisine: cuisine, name: name, photo_url_large: nil, photo_url_small: smallurl, uuid: id, source_url: nil, youtube_url: nil))
}
