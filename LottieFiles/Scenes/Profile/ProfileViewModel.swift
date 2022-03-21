//
//  ProfileViewModel.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 09/03/2022.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    
    var isUserLoggedIn: AnyPublisher<Bool, Never> {
        return userManager.isUserLoggedIn
    }
        
    private var cancellables = Set<AnyCancellable>()
    
    @Published var isLoading: Bool = false
    
    // MARK: - Inits

    private let userManager: UserManager
    
    init(userManager: UserManager = UserManager.shared) {
        self.userManager = userManager
        
        isUserLoggedIn.sink { [weak self] completion in
            self?.isLoading = false
        }.store(in: &cancellables)

    }
}

extension ProfileViewModel {
    func logout() {
        isLoading = true
        userManager.logout()
    }
    
    func login(email: String, password: String) {
        isLoading = true
        userManager.loginUser(email: email, password: password)
    }
}
