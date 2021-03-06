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

    var delegate: ProductViewDelegate?
    
    @IBOutlet weak var productTableView: UITableView!
  
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
    ClassConfiguration.productListModule(configure: self)
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
    delegate = self
    fetch()
    setupTableView()
  }
    
  // MARK: Setup
    func setupTableView(){
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.register(UINib(nibName: "ProductListTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductListTableViewCell")
        productTableView.rowHeight = UITableView.automaticDimension
        productTableView.separatorStyle = .none
        
    }
  
  func fetch()
  {
    interactor?.fetchProducts()
  }
  
    func displayProducts(viewModel: ProductEntity.ViewModel)
  {
    self.products = viewModel.products
    self.productTableView.reloadData()
  }
}


extension ProductListViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListTableViewCell", for: indexPath) as? ProductListTableViewCell
                
          let products = self.products[indexPath.row]
          cell?.setData(product: products)
        return cell!
                
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didItemPressed()
    }
 
}

extension ProductListViewController: ProductViewDelegate {
    func didItemPressed() {
        router?.routeToProductDetail(segue: nil)
    }
}
