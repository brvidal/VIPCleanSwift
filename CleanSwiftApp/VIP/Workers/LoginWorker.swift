//
//  LoginWorker.swift
//  CleanSwiftApp
//
//  Created by Benjoe Vidal on 7/25/20.
//  Copyright © 2020 BRV. All rights reserved.
//

import Foundation
import Alamofire
protocol LoginWorkerProtocol {
    func login(email: String, password: String, callBack: @escaping(Result<LoginEntity.Response, NSError>) -> Void)
}
class LoginWorker: LoginWorkerProtocol {
   func login(email: String, password: String, callBack: @escaping (Result<LoginEntity.Response, NSError>) -> Void) {
        let params = LoginEntity.Request(email: email, password: password)
                  AF.request("https://cleanswift.free.beeceptor.com/login",
                             method: .post,
                             parameters: params)
                            .validate()
                            .responseJSON { response in
                              debugPrint(response)
                                switch response.result{
                                case .success:
                                   let json = response.data
                                    do {
                                        let responseObject = LoginEntity.Response.self
                                        let result = try JSONDecoder().decode(responseObject, from: json!)
                                        callBack(.success(result))
                                    } catch let error as NSError {
                                       print("Error", error.localizedDescription)
                                      callBack(.failure(error))
                                    }
                                  
                                case .failure(let error):
                                    print(error)
                                }
                        }
    }

}
