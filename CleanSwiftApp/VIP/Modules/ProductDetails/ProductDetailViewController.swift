//
//  ProductDetailViewController.swift
//  CleanSwiftApp
//
//  Created by Benjoe Vidal on 8/7/20.
//  Copyright (c) 2020 BRV. All rights reserved.
//

import UIKit

protocol ProductDetailDisplayLogic: class
{
    func displayProductDetails(viewModel: ProductEntity.Response)
}

class ProductDetailViewController: UIViewController, ProductDetailDisplayLogic
{
    @IBOutlet weak var productName: UILabel!
    var interactor: ProductDetailBusinessLogic?
  var router: (NSObjectProtocol & ProductDetailRoutingLogic & ProductDetailDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    ClassConfiguration.productDetailsModule(configure: self)
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
  }
  
  // MARK: Do something
  
  func doSomething()
  {
    interactor?.getProduct()
  }
  
    func displayProductDetails(viewModel: ProductEntity.Response)
  {
    productName.text = viewModel.productName
  }
    
}
