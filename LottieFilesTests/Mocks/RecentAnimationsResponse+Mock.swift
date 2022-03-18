//
//  RecentAnimationsResponse.swift
//  LottieFilesTests
//
//  Created by AD0502-ADE-MB-1 on 18/03/2022.
//

import Foundation
@testable import LottieFiles

extension RecentAnimationsResponse {
    static func mock() -> RecentAnimationsResponse {
        let input = """
        {
            "data": {
                "recent": {
                    "currentPage": 1,
                    "perPage": 10,
                    "totalPages": 3703,
                    "from": 1,
                    "to": 10,
                    "total": 37022,
                    "results": [
                        {
                            "id": 68228,
                            "bgColor": "#FFFFFF",
                            "lottieUrl": "https://assets7.lottiefiles.com/packages/lf20_ijv6guhj.json",
                            "gifUrl": null,
                            "videoUrl": null,
                            "imageUrl": "https://assets.lottiefiles.com/previews/default.jpg",
                            "createdAt": "2021-07-09T03:20:20.000Z",
                            "name": "Robotic Animated Font Letter B",
                            "createdBy": {
                                "avatarUrl": "https://assets9.lottiefiles.com/avatars/300_94765-702240734.jpg",
                                "name": "Ilya Gusinski"
                            }
                        },
                        {
                            "id": 68227,
                            "bgColor": "none",
                            "lottieUrl": "https://assets8.lottiefiles.com/private_files/lf30_agmathcb.json",
                            "gifUrl": "https://assets8.lottiefiles.com/render/kqvt95k0.gif",
                            "videoUrl": "https://assets8.lottiefiles.com/render/kqvt95k0.mp4",
                            "imageUrl": "https://assets7.lottiefiles.com/render/kqvt95k0.png",
                            "createdAt": "2021-07-09T03:14:51.000Z",
                            "name": "ddocdoc_Bell",
                            "createdBy": {
                                "avatarUrl": "https://assets7.lottiefiles.com/avatars/300_5e5b56fb16079.jpg",
                                "name": "김태영"
                            }
                        },
                        {
                            "id": 68226,
                            "bgColor": "#FFFFFF",
                            "lottieUrl": "https://assets6.lottiefiles.com/packages/lf20_jffprore.json",
                            "gifUrl": "https://assets8.lottiefiles.com/render/kqvus3s8.gif",
                            "videoUrl": "https://assets8.lottiefiles.com/render/kqvus3s8.mp4",
                            "imageUrl": "https://assets7.lottiefiles.com/render/kqvus3s8.png",
                            "createdAt": "2021-07-09T01:56:03.000Z",
                            "name": "Loading payment",
                            "createdBy": {
                                "avatarUrl": "https://assets9.lottiefiles.com/avatars/300_6086dce22e4e3.jpg",
                                "name": "Juliano Sousa"
                            }
                        }
                    ]
                }
            }
        }
        """.data(using: .utf8)!
        
        let response = try! JSONDecoder().decode(RecentAnimationsResponse.self, from: input)
        return response
    }
}
