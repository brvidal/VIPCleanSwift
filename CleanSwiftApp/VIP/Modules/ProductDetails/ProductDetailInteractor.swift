//
//  ProductDetailInteractor.swift
//  CleanSwiftApp
//
//  Created by Benjoe Vidal on 8/7/20.
//  Copyright (c) 2020 BRV. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ProductDetailBusinessLogic
{
  func getProduct()
}

protocol ProductDetailDataStore
{
    var product: ProductEntity.Response! {get set}
}

class ProductDetailInteractor: ProductDetailBusinessLogic, ProductDetailDataStore
{
  
  var product: ProductEntity.Response!
    
    
    
    
  var presenter: ProductDetailPresentationLogic?
  var worker: ProductDetailWorker?
  
  // MARK: Do something
  
  func getProduct()
  {
//    worker = ProductDetailWorker()
    
    presenter?.presentProduct(response: product)
 
  }
}
