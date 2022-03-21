//
//  UserDefaults+Extensions.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 21/03/2022.
//

import Foundation

extension UserDefaults {
    @objc var isUserLoggedIn: Bool {
        get {
            return bool(forKey: "is_logged_in")
        }
        set {
            set(newValue, forKey: "is_logged_in")
        }
    }
}
