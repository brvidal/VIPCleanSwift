//
//  ProductListViewController.swift
//  CleanSwiftApp
//
//  Created by Benjoe Vidal on 8/7/20.
//  Copyright (c) 2020 BRV. All rights reserved.
//


import UIKit

protocol ProductListDisplayLogic: class
{
  func displayProducts(viewModel: ProductEntity.ViewModel)
}

class ProductListViewController: UIViewController, ProductListDisplayLogic
{
  var interactor: ProductListBusinessLogic?
  var router: (NSObjectProtocol & ProductListRoutingLogic & ProductListDataPassing)?

    
    var products: [Products] = []
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
    let viewController = self
    let interactor = ProductListInteractor()
    let presenter = ProductListPresenter()
    let router = ProductListRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
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
    fetch()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func fetch()
  {
    interactor?.fetchCart()
  }
  
    func displayProducts(viewModel: ProductEntity.ViewModel)
  {
    self.products = viewModel.products
    //nameTextField.text = viewModel.name
  }
}
