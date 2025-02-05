//
//  APIService.swift
//  RecipeVault
//
//  Created by Tanpreet Kaur on 2/3/25.
//

import Foundation

struct APIService {
    
    func fetchRecipes(from endpoint: String = Constants.recipesURL) async throws -> [Recipe] {
        
        guard let endpointURL = URL(string: endpoint) else {
            throw APIServiceError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: endpointURL)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw APIServiceError.invalidResponse
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode([String: [Recipe]].self, from: data)
            guard let recipes = decodedResponse["recipes"], !recipes.isEmpty else {
                return []
            }
            return recipes
        } catch {
            throw APIServiceError.malformedData
        }
    }
}
