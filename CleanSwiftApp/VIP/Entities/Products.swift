//
//  Products.swift
//  CleanSwiftApp
//
//  Created by Benjoe Vidal on 8/7/20.
//  Copyright © 2020 BRV. All rights reserved.
//

import Foundation

struct Products: Codable {
        let id: Int
          let productName, productPrice, productDescription, brandName: String

          enum CodingKeys: String, CodingKey {
              case id
              case productName = "product_name"
              case productPrice = "product_price"
              case productDescription = "product_description"
              case brandName = "brand_name"
          }
   }
