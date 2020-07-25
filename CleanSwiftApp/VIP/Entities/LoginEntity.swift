//
//  LoginEntity.swift
//  CleanSwiftApp
//
//  Created by Benjoe Vidal on 7/25/20.
//  Copyright © 2020 BRV. All rights reserved.
//

import Foundation


enum LoginEntity {
    
     struct Request: Codable {
        let email: String?
        let password: String?
    }
    
    struct Response:Codable{
        let id: Int
        let email, provider, lastName, firstName: String
        let middleName, maritalStatus, mobileNumber, telephoneNumber: String

        enum CodingKeys: String, CodingKey {
            case id, email, provider
            case lastName = "last_name"
            case firstName = "first_name"
            case middleName = "middle_name"
            case maritalStatus = "marital_status"
            case mobileNumber = "mobile_number"
            case telephoneNumber = "telephone_number"
        }
    }
  
    struct ViewModel {
        var email: String?
        var firstName: String?
        var lastName: String?
        var mobileNum: String?
    }
    
}
