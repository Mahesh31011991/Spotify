//
//  Product.swift
//  Spotify
//
//  Created by Mahesh Behere on 12/09/25.
//

import Foundation


// MARK: - Welcome
struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable,Identifiable {
    let id: Int
    let title, description: String
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let thumbnail: String
    let images: [String]
    
    var firstImage: String {
        images.first ?? Constant.randomImage
    }
    
    static var mock:Product{
        Product(
            id: 1,
            title: "Apple",
            description: "Apple Macbook Pro",
            price: 200,
            discountPercentage: 10,
            rating: 4.5,
            stock: 400,
            tags: [],
            brand: "Apple",
            sku: "ewewe",
            weight: 500,
            thumbnail: Constant.randomImage,
            images: [Constant.randomImage,Constant.randomImage,Constant.randomImage]
        )
    }
}




struct ProductRow:Identifiable{
    let id = UUID().uuidString
    let title : String
    let products:[Product]
}
