//
//  PopularAnimationsResponse+Mock.swift
//  LottieFilesTests
//
//  Created by AD0502-ADE-MB-1 on 18/03/2022.
//

import Foundation
@testable import LottieFiles

extension PopularAnimationsResponse {
    static func mock() -> PopularAnimationsResponse {
        let input = """
        {
            "data": {
                "popular": {
                    "currentPage": 1,
                    "perPage": 12,
                    "totalPages": 316,
                    "from": 1,
                    "to": 12,
                    "total": 3791,
                    "results": [
                        {
                            "id": 1370,
                            "bgColor": "#ffffff",
                            "lottieUrl": "https://assets4.lottiefiles.com/datafiles/U1I3rWEyksM9cCH/data.json",
                            "gifUrl": "https://assets3.lottiefiles.com/render/julivspr.gif",
                            "videoUrl": "https://assets3.lottiefiles.com/render/julivspr.mp4",
                            "imageUrl": "https://assets8.lottiefiles.com/render/julivspr.png",
                            "createdAt": "2018-02-02T15:53:12.000Z",
                            "name": "confetti",
                            "createdBy": {
                                "avatarUrl": "https://assets2.lottiefiles.com/avatars/300_454-630591834.jpg",
                                "name": "Jacques Mauriac"
                            }
                        },
                        {
                            "id": 427,
                            "bgColor": "#ffffff",
                            "lottieUrl": "https://assets8.lottiefiles.com/datafiles/zc3XRzudyWE36ZBJr7PIkkqq0PFIrIBgp4ojqShI/newAnimation.json",
                            "gifUrl": "https://assets10.lottiefiles.com/render/juml9ngj.gif",
                            "videoUrl": "https://assets10.lottiefiles.com/render/juml9ngj.mp4",
                            "imageUrl": "https://assets4.lottiefiles.com/render/juml9ngj.png",
                            "createdAt": "2017-07-28T14:25:49.000Z",
                            "name": "Happy Birthday!",
                            "createdBy": {
                                "avatarUrl": "https://assets7.lottiefiles.com/avatars/300_141.jpg",
                                "name": "Jan Semler"
                            }
                        },
                        {
                            "id": 782,
                            "bgColor": "#ffffff",
                            "lottieUrl": "https://assets5.lottiefiles.com/datafiles/8UjWgBkqvEF5jNoFcXV4sdJ6PXpS6DwF7cK4tzpi/Check Mark Success/Check Mark Success Data.json",
                            "gifUrl": "https://assets2.lottiefiles.com/render/jum1r6it.gif",
                            "videoUrl": "https://assets2.lottiefiles.com/render/jum1r6it.mp4",
                            "imageUrl": "https://assets1.lottiefiles.com/render/jum1r6it.png",
                            "createdAt": "2017-10-04T18:16:21.000Z",
                            "name": "Check Mark - Success",
                            "createdBy": {
                                "avatarUrl": "https://assets8.lottiefiles.com/avatars/300_183.jpg",
                                "name": "Travis Gregory"
                            }
                        }
                    ]
                }
            }
        }
        """.data(using: .utf8)!
        
        let response = try! JSONDecoder().decode(PopularAnimationsResponse.self, from: input)
        return response
    }
}
