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
