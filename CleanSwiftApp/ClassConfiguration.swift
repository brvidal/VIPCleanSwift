//
//  ClassConfiguration.swift
//  CleanSwiftApp
//
//  Created by Benjoe Vidal on 7/25/20.
//  Copyright © 2020 BRV. All rights reserved.
//

import Foundation

class ClassConfiguration: NSObject {
    
    class func loginModule(configure viewController: LoginViewController){
        //MARK: Initialise components.
        let interactor = LoginInteractor(withLoginWorker: LoginWorker())
        let presenter = LoginPresenter()
        let router = LoginRouter()
        
        
        //MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        router.viewController = viewController
        presenter.view = viewController
        
    }
    
    
    class func productListModule(configure viewController: ProductListViewController){
          //MARK: Initialise components.
           let interactor = ProductListInteractor(withProductWorker: ProductWorker())
           let presenter = ProductListPresenter()
           let router = ProductListRouter()
        
          //MARK: link VIP components.
           viewController.interactor = interactor
           viewController.router = router
           interactor.presenter = presenter
        
           presenter.viewController = viewController
        
           router.viewController = viewController
           router.dataStore = interactor
    }
    
    
    class func productDetailsModule(configure viewController: ProductDetailViewController) {
           let interactor = ProductDetailInteractor()
           let presenter = ProductDetailPresenter()
           let router = ProductDetailRouter()
        
           viewController.interactor = interactor
           viewController.router = router
           interactor.presenter = presenter
           presenter.viewController = viewController
           router.viewController = viewController
           router.dataStore = interactor
    }
    
}
