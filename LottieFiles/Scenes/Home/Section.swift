//
//  Section.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 15/03/2022.
//

import Foundation
import UIKit

enum SectionType: Hashable {
    case login
    case featured
    case people
    case blog
}

struct Section: Identifiable, Hashable {
    let id: UUID = UUID()
    let title: String
    let type: SectionType
    let items: [HomeItem]
}

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

    // MARK: - Inits

    private var animatorResponse: AnimatorResponse?
    private var response: LottieResponse?
    private var blogResponse: Blog?
    
    init(response: LottieResponse) {
        self.response = response
    }
    
    init(animatorResponse: AnimatorResponse?) {
        self.animatorResponse = animatorResponse
    }
    
    init(blogResponse: Blog) {
        self.blogResponse = blogResponse
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
