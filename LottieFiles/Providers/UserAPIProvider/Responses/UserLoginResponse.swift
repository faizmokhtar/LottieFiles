//
//  UserLoginResponse.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 21/03/2022.
//

import Foundation

struct  UserLoginResponse: Decodable {
    let firstName: String
    let lastName: String
    let email: String
    let provider: String
}
