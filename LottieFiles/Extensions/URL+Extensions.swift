//
//  URL+Extensions.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 13/03/2022.
//

import Foundation

extension URL {

    /// Append parameter query to URL
    ///
    /// Usage:
    ///
    ///     URL(string: "dummy").appending([URLQueryItem("param", "value"])
    ///
    /// - Parameter queryItems: Array of `URLQueryItem`
    func appending(_ queryItems: [URLQueryItem]) -> URL? {
        guard var urlComponents = URLComponents(
            url: self,
            resolvingAgainstBaseURL: true) else {
            return nil
        }
        urlComponents.queryItems = (urlComponents.queryItems ?? []) + queryItems
        return urlComponents.url
    }
}
