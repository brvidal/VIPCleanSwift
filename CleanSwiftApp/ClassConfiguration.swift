//
//  ClassConfiguration.swift
//  CleanSwiftApp
//
//  Created by Benjoe Vidal on 7/25/20.
//  Copyright © 2020 BRV. All rights reserved.
//

import Foundation

class ClassConfiguration: NSObject {
    
    class func loginModule(configure viewController: LoginViewProtocol){
        //MARK: Initialise components.
        let interactor = LoginInteractor(withLoginWorker: LoginWorker())
        let presenter = LoginPresenter()
               
        //MARK: link VIP components.
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.view = viewController
        
    }
    
}
