//
//  RecipeViewModelTests.swift
//  RecipeVaultTests
//
//  Created by Tanpreet Kaur on 2/3/25.
//

import XCTest
@testable import RecipeVault

@MainActor
final class RecipeViewModelTests: XCTestCase {
    
    private var viewModel: RecipeViewModel!
    
    let invalidResURL = "https://d3jbb8n5wk0qxi.cloudfront.net/invalid.json"
    let malformedURL = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
    let emptyDataURL = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
    
    override func setUp() {
        super.setUp()
        viewModel = RecipeViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    // Test: viewModel.fetchRecipes(), successful
    func test_fetchRecipes() async {
        await viewModel.fetchRecipes()
        
        XCTAssertFalse(viewModel.recipes.isEmpty)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    // Test: loading state, before fetch
    func test_loadingState_BeforeFetch() {
        XCTAssertTrue(viewModel.isLoading)
    }
    
    // Test: loading state, after fetch
    func test_loadingState_AfterFetch() async {
        await viewModel.fetchRecipes()
        XCTAssertFalse(viewModel.isLoading)
    }
    
    // Test: viewModel.fetchRecipes(), invalidURL error message
    func test_fetchRecipes_InvalidURL() async {
        
        await viewModel.fetchRecipes(from: "")
        
        XCTAssertEqual(viewModel.errorMessage, "Error: Couldn't load recipes.")
        XCTAssertTrue(viewModel.recipes.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    // Test: viewModel.fetchRecipes(), invalidResponse error message
    func test_fetchRecipes_InvalidResponse() async {
        
        await viewModel.fetchRecipes(from: invalidResURL)
        
        XCTAssertEqual(viewModel.errorMessage, "Error: Couldn't load recipes.")
        XCTAssertTrue(viewModel.recipes.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    // Test: viewModel.fetchRecipes() with malformed data
    func test_fetchRecipes_MalformedData() async {
        
        await viewModel.fetchRecipes(from: malformedURL)
        
        XCTAssertEqual(viewModel.errorMessage, "The recipe data is corrupted.")
        XCTAssertTrue(viewModel.recipes.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    // Test: viewModel.fetchRecipes(), empty data
    func testFetchRecipes_EmptyData() async {
        
        await viewModel.fetchRecipes(from: emptyDataURL)
        
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertTrue(viewModel.recipes.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
    }
}
