//
//  UserLoginPayload.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 21/03/2022.
//

import Foundation

struct UserLoginPayload: Encodable {
    let email: String
    let password: String?
    let token: String?
}
