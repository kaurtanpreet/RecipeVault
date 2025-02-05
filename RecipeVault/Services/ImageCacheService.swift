//
//  ImageCacheService.swift
//  RecipeVault
//
//  Created by Tanpreet Kaur on 2/3/25.
//

import SwiftUI

class ImageCacheService {
    static let shared = ImageCacheService()
    private let cache = NSCache<NSString, UIImage>()
    
    func loadImage(from url: String) async -> UIImage? {
        if let cachedImage = cache.object(forKey: url as NSString) {
            return cachedImage
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: url)!)
            if let image = UIImage(data: data) {
                cache.setObject(image, forKey: url as NSString)
                return image
            }
        } catch {
            print("Error loading image: \(error)")
        }
        return nil
    }
}
