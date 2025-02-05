//
//  ImageCacheServiceTests.swift
//  RecipeVaultTests
//
//  Created by Tanpreet Kaur on 2/3/25.
//

import XCTest
import UIKit
@testable import RecipeVault

final class ImageCacheServiceTests: XCTestCase {
    
    private var imageCacheService: ImageCacheService!
    
    let testImageURL =  "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/small.jpg"
    let invalidImageURL =  "https://d3jbb8n5wk0qxi.cloudfront.net/photos/invalid/image.jpg"
    
    override func setUp() {
        super.setUp()
        imageCacheService = ImageCacheService.shared
    }
    
    override func tearDown() {
        imageCacheService = nil
        super.tearDown()
    }
    
    // Test: loadImage(), successful
    func test_loadImage() async {
        let image = await imageCacheService.loadImage(from: testImageURL)
        XCTAssertNotNil(image)
    }
    
    // Test: loadImage(), from cache
    
    // calls loadImage() twice to confirm the second call loads
    // the image from cache by tracking print() in loadImage()
    func test_loadImage_FromCache() async {
        let image = await imageCacheService.loadImage(from: testImageURL)
        let imageFromCache = await imageCacheService.loadImage(from: testImageURL)
        XCTAssertNotNil(image)
        XCTAssertNotNil(imageFromCache)
    }
    
    // Test: loadImage(), error loading image
    func test_loadImage_Error() async {
        let image = await imageCacheService.loadImage(from: invalidImageURL)
        XCTAssertNil(image)
    }
}
