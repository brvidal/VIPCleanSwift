//
//  ProductListPresenter.swift
//  CleanSwiftApp
//
//  Created by Benjoe Vidal on 8/7/20.
//  Copyright (c) 2020 BRV. All rights reserved.
//

import UIKit

protocol ProductListPresentationLogic
{
    func presentProducts(response: ProductEntity.Response)
    func interactor(_ interactor: ProductListBusinessLogic, didFailWith object: Error)
}

class ProductListPresenter: ProductListPresentationLogic
{
   
   
    
    
    
  weak var viewController: ProductListDisplayLogic?
  
  // MARK: Do something
  
    func presentProducts(response: ProductEntity.Response) {
        let viewModel = ProductEntity.ViewModel(products: response.products)
        viewController?.displayProducts(viewModel: viewModel)
    }
    
 
    func interactor(_ interactor: ProductListBusinessLogic, didFailWith object: Error) {
           
    }
       
}
