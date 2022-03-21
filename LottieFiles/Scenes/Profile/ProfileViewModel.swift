//
//  ProfileViewModel.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 09/03/2022.
//

import Foundation
import Combine

class ProfileViewModel {
    
    var isUserLoggedIn: AnyPublisher<Bool, Never> {
        return userManager.isUserLoggedIn
    }
        
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Inits

    private let userManager: UserManager
    
    init(userManager: UserManager = UserManager.shared) {
        self.userManager = userManager
    }
}

extension ProfileViewModel {
    func logout() {
        userManager.logout()
    }
    
    func login(email: String, password: String) {
        userManager.loginUser(email: email, password: password)
    }
}
