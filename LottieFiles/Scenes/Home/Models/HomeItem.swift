//
//  HomeItem.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 21/03/2022.
//

import Foundation
import UIKit

struct HomeItem: Equatable {
    
    let id = UUID()
    
    var animationURL: URL? {
        guard let lottieURL = response?.lottieURL else { return nil }
        return URL(string: lottieURL)
    }
    
    var backgroundColor: UIColor? {
        guard let bgColor = response?.bgColor else { return nil }
        return UIColor(hex: bgColor)
    }
    
    var name: String? {
        return response?.name
    }
    
    var authorName: String? {
        return response?.createdBy.name
    }
    
    var avatarUrl: URL? {
        guard let url = animatorResponse?.avatarURL else { return nil }
        return URL(string: url)
    }
    
    var avatarName: String? {
        return animatorResponse?.name
    }
    
    var blogTitle: String? {
        return blogResponse?.title
    }
    
    var blogImageURL: URL? {
        guard let url = blogResponse?.imageURL else { return nil }
        return URL(string: url)
    }
    
    var loggedInUsername: String? {
        return user?.firstName
    }
    
    var loginDate: String? {
        return DateFormatter.simple.string(from: Date())
    }
    
    // MARK: - Inits
    
    private(set) var response: LottieResponse?
    private var animatorResponse: AnimatorResponse?
    private var blogResponse: Blog?
    private var user: User?
    
    init(response: LottieResponse) {
        self.response = response
    }
    
    init(animatorResponse: AnimatorResponse?) {
        self.animatorResponse = animatorResponse
    }
    
    init(blogResponse: Blog) {
        self.blogResponse = blogResponse
    }
    
    init(user: User?) {
        self.user = user
    }
}

extension HomeItem: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }
    
    static func == (lhs: HomeItem, rhs: HomeItem) -> Bool {
        return lhs.id == rhs.id
    }
}
