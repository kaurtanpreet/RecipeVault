//
//  RecipeViewModel.swift
//  RecipeVault
//
//  Created by Tanpreet Kaur on 2/3/25.
//

import Foundation

@MainActor
class RecipeViewModel: ObservableObject {
    
    @Published var recipes: [Recipe] = []
    @Published var isLoading = true
    @Published var errorMessage: String?
    
    private let apiService = APIService()
    
    func fetchRecipes(from endpoint: String = Constants.recipesURL) async {
        isLoading = true
        errorMessage = nil
        
        do {
            let fetchedRecipes = try await apiService.fetchRecipes(from: endpoint)
            recipes = fetchedRecipes
        } catch APIServiceError.invalidURL, APIServiceError.invalidResponse {
            errorMessage = "Error: Couldn't load recipes."
        } catch APIServiceError.malformedData {
            errorMessage = "The recipe data is corrupted."
        } catch {
            errorMessage = "An unexpected error occurred."
        }
        isLoading = false
    }
}
