//
//  HomeViewController.swift
//  WelcomeBackMVVM
//
//  Created by Алексей Гайдуков on 21.10.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinders()
        viewModel.getLogInUser()
        
    }
    private func setupBinders() {
        viewModel.welcomeMessage.bind { [weak self] message in
            self?.welcomeLabel.text = message
        }
    }
}
