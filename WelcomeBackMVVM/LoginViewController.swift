//
//  LoginViewController.swift
//  WelcomeBackMVVM
//
//  Created by Алексей Гайдуков on 20.10.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var mailTextField: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    //MARK: Private Method
    private let viewModel = LoginViewModel()
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBinders()
    }
    
    private func setupBinders() {
        viewModel.error.bind { [weak self] error in
            if let error = error {
                print(error)
            } else {
                self?.goToHomePage()
            }
        }
    }
    
    private func goToHomePage() {
        let controller = storyboard?.instantiateViewController(
            withIdentifier: "HomeViewController") as! HomeViewController
        present(controller, animated: true, completion: nil)
    }
    
    //MARK: IBAction
    
    @IBAction func loginButtonPress(_ sender: Any) {
        guard let email = mailTextField.text,
              let password = passwordTextfield.text else {
            print("Please enter email and password")
            return
        }
        viewModel.login(email: email, password: password)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

