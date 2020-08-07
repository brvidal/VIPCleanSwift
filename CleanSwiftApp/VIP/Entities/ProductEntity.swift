//
//  ProductEntity.swift
//  CleanSwiftApp
//
//  Created by Benjoe Vidal on 8/7/20.
//  Copyright © 2020 BRV. All rights reserved.
//

import Foundation

// MARK: - ProductElement
enum ProductEntity {
    struct Request: Codable{
        
    }
    struct Response: Codable {
        var products: [Products]
    }
    
    struct ViewModel: Codable {
        var products: [Products]
    }
}
