//
//  NetworkService.swift
//  WelcomeBackMVVM
//
//  Created by Алексей Гайдуков on 20.10.2022.
//

import Foundation


final class NetworkService {
    static let shared = NetworkService()
    var user: User?
    
    private init() { }
    
    func login(email: String, password: String, completion: @escaping(Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            if email == "test@test.com" && password == "password" {
                self?.user = User(
                    firstName: "Alexey",
                    lastName: "Gaida",
                    email: "test@test.com",
                    age: 24
                )
                completion(true)
            } else {
                self?.user = nil
                completion(false)
            }
        }
    }
}
