//
//  ProductListRouter.swift
//  CleanSwiftApp
//
//  Created by Benjoe Vidal on 8/7/20.
//  Copyright (c) 2020 BRV. All rights reserved.
//


import UIKit

@objc protocol ProductListRoutingLogic
{
  func routeToProductDetail(segue: UIStoryboardSegue?)
}

protocol ProductListDataPassing
{
  var dataStore: ProductListDataStore? { get }
}

class ProductListRouter: NSObject, ProductListRoutingLogic, ProductListDataPassing
{
  var dataStore: ProductListDataStore?
    
  weak var viewController: ProductListViewController?
  
  
  // MARK: Routing
  
  func routeToProductDetail(segue: UIStoryboardSegue?)
  {
    if let segue = segue {
      let destinationVC = segue.destination as! ProductDetailViewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToProductDetail(source: dataStore!, destination: &destinationDS)
    } else {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let destinationVC = storyboard.instantiateViewController(withIdentifier: "ProductDetailViewController") as! ProductDetailViewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToProductDetail(source: dataStore!, destination: &destinationDS)
      navigateToProductDetail(source: viewController!, destination: destinationVC)
    }
  }

  // MARK: Navigation
  
  func navigateToProductDetail(source: ProductListViewController, destination: ProductDetailViewController)
  {
    source.show(destination, sender: nil)
  }
  
  // MARK: Passing data
  
  func passDataToProductDetail(source: ProductListDataStore, destination: inout ProductDetailDataStore)
  {
    let selectedRow = viewController?.productTableView.indexPathForSelectedRow?.row
    let selectedProduct = source.products?[selectedRow!]
    destination.product = selectedProduct
  }
    
}
