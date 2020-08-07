//
//  LoginViewController.swift
//  CleanSwiftApp
//
//  Created by Benjoe Vidal on 7/25/20.
//  Copyright © 2020 BRV. All rights reserved.
//

import UIKit

protocol LoginViewProtocol: class {
    var interactor: LoginInteractorProtocol? {get set}
    func set(viewModel: LoginEntity.ViewModel)
}

class LoginViewController: UIViewController, LoginViewProtocol {
    var interactor: LoginInteractorProtocol?
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
     {
       super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        ClassConfiguration.loginModule(configure: self)
     }
     
     required init?(coder aDecoder: NSCoder)
     {
       super.init(coder: aDecoder)
        ClassConfiguration.loginModule(configure: self)
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ClassConfiguration.loginModule(configure: self)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signinButton(_ sender: UIButton) {
        if let email = emailTextField.text, let password =  passwordTextField.text {
            interactor?.login(email: email, password: password)
        }
    }
    
    func set(viewModel: LoginEntity.ViewModel) {
        print("EMAIL", viewModel.email!)
    }
    
}
