//
//  HomeViewModel.swift
//  WelcomeBackMVVM
//
//  Created by Алексей Гайдуков on 21.10.2022.
//

import Foundation

final class HomeViewModel {
    var welcomeMessage: ObservableObject<String?> = ObservableObject(nil)
    
    func getLogInUser() {
        let user = NetworkService.shared.getLogInUser()
        self.welcomeMessage.value = "Hello, \(user.firstName) \(user.lastName)"
    }
}
