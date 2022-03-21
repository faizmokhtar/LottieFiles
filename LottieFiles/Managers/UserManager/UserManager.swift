//
//  UserManager.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 21/03/2022.
//

import Foundation
import Combine

class UserManager {
    
    static let shared = UserManager()

    private var cancellables = Set<AnyCancellable>()
    
    private let userDefaults: UserDefaults
    private let apiProvider: UserAPIProviderProtocol

    init(
        userDefaults: UserDefaults = UserDefaults.standard,
        apiProvider: UserAPIProviderProtocol = UserAPIProvider()
    ) {
        self.userDefaults = userDefaults
        self.apiProvider = apiProvider
    }
    
    var user: User?
    
    var isUserLoggedIn: AnyPublisher<Bool, Never> {
        return userDefaults.publisher(for: \.isUserLoggedIn)
            .eraseToAnyPublisher()
    }
    
    func updateLoginStatus(isLoggedIn: Bool) {
        userDefaults.isUserLoggedIn = isLoggedIn
    }
    
    func logout() {
        apiProvider.fetchLogout()
            .sink { _ in
                UserDefaults.standard.isUserLoggedIn = false
            }
            .store(in: &cancellables)
    }
    
    func loginUser(email: String, password: String) {
        let user = UserLoginPayload(email: email, password: password, token: nil)
        apiProvider.fetchUserLogin(user: user)
            .map({ response in
                User(firstName: response.firstName, lastName: response.lastName, email: response.email)
            })
            .sink { [weak self] user in
                self?.user = user
                UserDefaults.standard.isUserLoggedIn = true
            }
            .store(in: &cancellables)
    }
}
