//
//  ContentView.swift
//  RecipeVault
//
//  Created by Tanpreet Kaur on 2/3/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = RecipeViewModel()
    @State private var gridView = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                Group {
                    if viewModel.isLoading {
                        ProgressView()
                    } else if let errorMessage = viewModel.errorMessage {
                        ErrorStateView(message: errorMessage)
                    } else if viewModel.recipes.isEmpty {
                        EmptyStateView()
                    } else {
                        if gridView {
                            RecipeGridView(recipes: viewModel.recipes)
                        } else {
                            RecipeListView(recipes: viewModel.recipes)
                                .padding(.vertical)
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("Recipes")
                            .font(.largeTitle)
                            .foregroundStyle(.brown)
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: { gridView.toggle() }) {
                            Image(systemName: gridView ? "list.bullet" : "square.grid.2x2")
                                .foregroundStyle(.brown)
                                .padding()
                        }
                    }
                }
            }
            .task {
                await viewModel.fetchRecipes()
            }
            .refreshable {
                await viewModel.fetchRecipes()
            }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ContentView()
}
