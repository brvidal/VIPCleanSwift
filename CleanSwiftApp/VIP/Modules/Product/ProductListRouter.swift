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
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol ProductListDataPassing
{
  var dataStore: ProductListDataStore? { get }
}

class ProductListRouter: NSObject, ProductListRoutingLogic, ProductListDataPassing
{
  weak var viewController: ProductListViewController?
  var dataStore: ProductListDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: ProductListViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: ProductListDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
