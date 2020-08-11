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
  func fetchCart()
}

protocol ProductListDataStore
{
    var products: [ProductEntity.Response]! {get set}
}

class ProductListInteractor: ProductListBusinessLogic, ProductListDataStore
{

  var products: [ProductEntity.Response]!
    
  var presenter: ProductListPresentationLogic?
  var worker: ProductWorker?
  
  // MARK: Do something
  
    func fetchCart() {
    worker = ProductWorker()
    worker?.fetchProducts() { (response) in
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
