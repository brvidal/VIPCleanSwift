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
    
}
