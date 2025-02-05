//
//  ImageView.swift
//  RecipeVault
//
//  Created by Tanpreet Kaur on 2/4/25.
//

import SwiftUI

struct ImageView: View {
    let urlString: String?
    
    @State private var image: UIImage? = nil
    
    var body: some View {
        Group {
            if let image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                ProgressView()
                    .task {
                        await loadImage()
                    }
            }
        }
    }
    
    private func loadImage() async {
        guard let urlString else { return }
        image = await ImageCacheService.shared.loadImage(from: urlString)
    }
}

#Preview {
    ImageView(urlString: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/small.jpg")
}
