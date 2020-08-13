//
//  ProductListInteractor.swift
//  CleanSwiftApp
//
//  Created by Benjoe Vidal on 8/7/20.
//  Copyright (c) 2020 BRV. All rights reserved.
//


import UIKit

protocol ProductListBusinessLogic
{
  func fetchProducts()
}

protocol ProductListDataStore
{
    var products: [ProductEntity.Response]! {get set}
}

class ProductListInteractor: ProductListBusinessLogic, ProductListDataStore
{

  var products: [ProductEntity.Response]!
  var presenter: ProductListPresentationLogic?
    
  private let worker: ProductWorkerProtocol
    
    required init(withProductWorker productWorker: ProductWorkerProtocol) {
        self.worker = productWorker
    }
    
    func fetchProducts() {
        worker.fetchProducts() { (response) in
        switch(response){
        case .success(let result):
            self.products = result
            self.presenter?.presentProducts(response: result)
            break;
        
        case .failure(let error):
            self.presenter?.interactor(self, didFailWith: error)
            break;
        }
                 
    }
 }
   
}
