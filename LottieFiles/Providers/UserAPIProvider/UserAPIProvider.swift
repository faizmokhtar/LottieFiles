//
//  UserAPIProvider.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 21/03/2022.
//

import Foundation
import Combine

// TODO: replace it with real API calls
/// This is just a dummy API class to demostrate API calls for user auth
class UserAPIProvider: UserAPIProviderProtocol {
    func fetchUserLogin(user: UserLoginPayload) -> AnyPublisher<UserLoginResponse, Never> {
        return Future { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                let response = UserLoginResponse(firstName: "Faiz", lastName: "Mokhtar", email: "mfmokhtar@gmail.com", provider: "google")
                return promise(.success(response))
            }
        }.eraseToAnyPublisher()
    }
    
    func fetchLogout() -> AnyPublisher<UserLogoutResponse, Never> {
        return Future { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                let response = UserLogoutResponse()
                return promise(.success(response))
            }
        }.eraseToAnyPublisher()
    }    
}
