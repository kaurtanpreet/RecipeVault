//
//  APIServiceTests.swift
//  RecipeVaultTests
//
//  Created by Tanpreet Kaur on 2/3/25.
//

import XCTest
@testable import RecipeVault

final class APIServiceTests: XCTestCase {
    
    private var apiService: APIService!
    
    let invalidResURL = "https://d3jbb8n5wk0qxi.cloudfront.net/invalid.json"
    let malformedURL = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
    let emptyDataURL = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
    
    
    override func setUp() {
        super.setUp()
        apiService = APIService()
    }
    
    override func tearDown() {
        apiService = nil
        super.tearDown()
    }
    
    // Test: fetchRecipes() is successful
    func test_fetchRecipes() async {
        do {
            let recipes = try await apiService.fetchRecipes()
            XCTAssertFalse(recipes.isEmpty)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    // Test: fetchRecipes() with an empty url
    func test_fetchRecipes_InvalidURL() async {
        do {
            let recipes = try await apiService.fetchRecipes(from: "")
            XCTAssertTrue(recipes.isEmpty)
        } catch APIServiceError.invalidURL {
            XCTAssertTrue(true)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    // Test: fetchRecipes(), invalid response error
    func test_fetchRecipes_InvalidResponse() async {
        do {
            let recipes = try await apiService.fetchRecipes(from: invalidResURL)
            XCTAssertTrue(recipes.isEmpty)
        } catch APIServiceError.invalidResponse {
            XCTAssertTrue(true)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    // Test: fetchRecipes() with malformed data
    func test_fetchRecipes_MalformedData() async {
        do {
            let recipes = try await apiService.fetchRecipes(from: malformedURL)
            XCTAssertTrue(recipes.isEmpty)
        } catch APIServiceError.malformedData {
            XCTAssertTrue(true)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    // Test: fetchRecipes() with empty data
    func test_fetchRecipes_EmptyData() async {
        do {
            let recipes = try await apiService.fetchRecipes(from: emptyDataURL)
            XCTAssertTrue(recipes.isEmpty)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
}

