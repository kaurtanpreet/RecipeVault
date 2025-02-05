//
//  APIServiceError.swift
//  RecipeVault
//
//  Created by Tanpreet Kaur on 2/3/25.
//

import Foundation

public enum APIServiceError: Error {
    case invalidURL
    case invalidResponse
    case malformedData
}
