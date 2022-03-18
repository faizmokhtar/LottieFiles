//
//  FeaturedAnimationsResponse+Mock.swift
//  LottieFilesTests
//
//  Created by AD0502-ADE-MB-1 on 18/03/2022.
//

import Foundation
@testable import LottieFiles

extension FeaturedAnimationsResponse {
    static func mock() -> FeaturedAnimationsResponse {
        let input = """
        {
            "data": {
                "featured": {
                    "currentPage": 1,
                    "perPage": 10,
                    "totalPages": 121,
                    "from": 1,
                    "to": 10,
                    "total": 1206,
                    "results": [
                        {
                            "id": 62218,
                            "bgColor": "#FFFFFF",
                            "lottieUrl": "https://assets10.lottiefiles.com/packages/lf20_aakruwkk.json",
                            "gifUrl": "https://assets1.lottiefiles.com/render/koryu6lo.gif",
                            "videoUrl": "https://assets1.lottiefiles.com/render/koryu6lo.mp4",
                            "imageUrl": "https://assets1.lottiefiles.com/render/koryu6lo.png",
                            "createdAt": "2021-05-16T13:55:56.000Z",
                            "name": "Pineapple Yoga with music",
                            "createdBy": {
                                "avatarUrl": "https://assets3.lottiefiles.com/avatars/300_120122-362745608.jpg",
                                "name": "Bashir Ahmed"
                            }
                        },
                        {
                            "id": 62170,
                            "bgColor": "#FFFFFF",
                            "lottieUrl": "https://assets3.lottiefiles.com/packages/lf20_sfmn3v5w.json",
                            "gifUrl": "https://assets6.lottiefiles.com/render/koqudini.gif",
                            "videoUrl": "https://assets6.lottiefiles.com/render/koqudini.mp4",
                            "imageUrl": "https://assets1.lottiefiles.com/render/koqudini.png",
                            "createdAt": "2021-05-15T10:55:53.000Z",
                            "name": "Beautiful animation of page loading in the form of a circle",
                            "createdBy": {
                                "avatarUrl": "https://assets8.lottiefiles.com/avatars/300_859621-9369469.jpg",
                                "name": "Дмитрий Козлов"
                            }
                        },
                        {
                            "id": 62155,
                            "bgColor": "#FFFFFF",
                            "lottieUrl": "https://assets4.lottiefiles.com/packages/lf20_4otRkt.json",
                            "gifUrl": "https://assets8.lottiefiles.com/render/koqu9f6m.gif",
                            "videoUrl": "https://assets8.lottiefiles.com/render/koqu9f6m.mp4",
                            "imageUrl": "https://assets2.lottiefiles.com/render/koqu9f6m.png",
                            "createdAt": "2021-05-15T09:39:06.000Z",
                            "name": "Tutorial Zoom",
                            "createdBy": {
                                "avatarUrl": "https://assets6.lottiefiles.com/avatars/300_profile-photo-1621069353.png",
                                "name": "Alex Arkhipenko"
                            }
                        }
                    ]
                }
            }
        }
        """.data(using: .utf8)!
        
        let response = try! JSONDecoder().decode(FeaturedAnimationsResponse.self, from: input)
        return response
    }
}
