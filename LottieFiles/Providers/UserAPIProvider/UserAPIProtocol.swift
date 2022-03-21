//
//  UserAPIProtocol.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 21/03/2022.
//

import Foundation

protocol UserAPIProviderProtocol {
    func fetchUserLogin(user: UserLoginPayload) -> AnyPublisher<UserLoginResponse, Never>

    func fetchLogout() -> AnyPublisher<UserLogoutResponse, Never>
}
