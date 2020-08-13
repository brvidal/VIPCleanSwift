//
//  ProductWorker.swift
//  CleanSwiftApp
//
//  Created by Benjoe Vidal on 8/7/20.
//  Copyright © 2020 BRV. All rights reserved.
//

import Foundation
import Alamofire

protocol ProductWorkerProtocol {
    func fetchProducts(callBack:  @escaping(Result<[ProductEntity.Response], Error>) -> Void)
}

class ProductWorker: ProductWorkerProtocol {
    func fetchProducts(callBack: @escaping (Result<[ProductEntity.Response], Error>) -> Void) {
        AF.request("https://cleanswift.free.beeceptor.com/productlist",
                            method: .get)
                            .validate()
                            .responseJSON { response in
                                switch response.result{
                                   case .success:
                                           print(response.result)   // result of response serialization
                                       let json = response.data
                                           do {
                                               
                                           let products = try JSONDecoder().decode([ProductEntity.Response].self, from: json!)
                                           callBack(.success(products))
                                           
                                           }catch DecodingError.typeMismatch(let type, let context) {
                                                  print("\(type) was expected, \(context.debugDescription)")
                                                  print("Type '\(type)' mismatch:", context.debugDescription)
                                                  print("codingPath:", context.codingPath)
                                           } catch DecodingError.valueNotFound(let type, let context) {
                                                  print("no value was found for \(type), \(context.debugDescription)")
                                                  print("codingPath:", context.codingPath)
                                           } catch (let error){
                                                  print(error)
                                           }
                                                  
                                case .failure(let error):
                                    callBack(.failure(error))
                                    break
                                    
                                   }
                        }
    }
    
}
