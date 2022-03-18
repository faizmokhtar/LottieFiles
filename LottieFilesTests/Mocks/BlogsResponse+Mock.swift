//
//  BlogsResponse+Mock.swift
//  LottieFilesTests
//
//  Created by AD0502-ADE-MB-1 on 18/03/2022.
//

import Foundation
@testable import LottieFiles

extension BlogsResponse {
    static func mock() -> BlogsResponse {
        let input = """
        {
            "data": {
                "blogs": {
                    "currentPage": 1,
                    "perPage": 16,
                    "totalPages": 6,
                    "from": 1,
                    "to": 16,
                    "total": 83,
                    "results": [
                        {
                            "title": "The Key to An Immersive UX: Animation",
                            "postedAt": "2021-07-08T00:00:00.000Z",
                            "imageUrl": "https://d3jl769oy69y7b.cloudfront.net/2021/07/Blog-Visual---The-Key-to-An-Immersive-UX_-Animation.png"
                        },
                        {
                            "title": "LottieFiles Animations are accessible across 25,000+ everyday tools with the embed feature",
                            "postedAt": "2021-06-18T00:00:00.000Z",
                            "imageUrl": "https://d3jl769oy69y7b.cloudfront.net/2021/06/Embed-Blog-OG.png"
                        },
                        {
                            "title": "How to animate Lottie in response to audio",
                            "postedAt": "2021-06-08T00:00:00.000Z",
                            "imageUrl": "https://d3jl769oy69y7b.cloudfront.net/2021/06/Blog-Visual---Article--How-to-make-a-Lottie-responsive-to-audio-01-Blog.jpg"
                        },
                        {
                            "title": "Kicking off the documentation of the Lottie JSON object",
                            "postedAt": "2021-06-01T00:00:00.000Z",
                            "imageUrl": "https://d3jl769oy69y7b.cloudfront.net/2021/06/The-Lottie-JSON-object-01.jpg"
                        },
                        {
                            "title": "Some Easy Workflow Tips to Keep Bodymovin JSON Sizes Down and Performance Up",
                            "postedAt": "2021-05-19T00:00:00.000Z",
                            "imageUrl": "https://d3jl769oy69y7b.cloudfront.net/2021/05/Aaron-schurman-Lottie-1-1.jpg"
                        },
                        {
                            "title": "How Engineering Magic Made Delight for Kids Easily Achievable Within YouTube Kids",
                            "postedAt": "2021-05-19T00:00:00.000Z",
                            "imageUrl": "https://d3jl769oy69y7b.cloudfront.net/2021/05/Aaron-schurman-Lottie-1-2.jpg"
                        },
                        {
                            "title": "What is a Lottie? The Official Guide to Lottie",
                            "postedAt": "2021-04-23T00:00:00.000Z",
                            "imageUrl": "https://assets-blog.lottiefiles.dev/2021/04/what-is-lottie.png"
                        },
                        {
                            "title": "Team LottieFiles: Jia Yu Hong, Product Designer",
                            "postedAt": "2021-04-22T00:00:00.000Z",
                            "imageUrl": "https://d3jl769oy69y7b.cloudfront.net/2021/05/jia-yu-blog.jpg"
                        },
                        {
                            "title": "Design Inspiration: Blobs",
                            "postedAt": "2021-04-19T00:00:00.000Z",
                            "imageUrl": "https://d3jl769oy69y7b.cloudfront.net/2021/05/Blobs-Design-2-04.jpg"
                        },
                        {
                            "title": "The LottieFiles Desktop app",
                            "postedAt": "2021-04-07T00:00:00.000Z",
                            "imageUrl": "https://d3jl769oy69y7b.cloudfront.net/2021/05/desktop-app-lottiefiles.jpg"
                        },
                        {
                            "title": "Design Inspiration: Morphing Lottie Animation Icons",
                            "postedAt": "2021-04-06T00:00:00.000Z",
                            "imageUrl": "https://d3jl769oy69y7b.cloudfront.net/2021/05/Morphing-animation-02.jpg"
                        },
                        {
                            "title": "Power of Interactive Content as More Users Globally Spend More Time Online",
                            "postedAt": "2021-04-02T00:00:00.000Z",
                            "imageUrl": "https://d3jl769oy69y7b.cloudfront.net/2021/05/The-power-of-interactive-content-02.jpg"
                        },
                        {
                            "title": "Team LottieFiles: Sharon Lee, Visual Designer",
                            "postedAt": "2021-04-01T00:00:00.000Z",
                            "imageUrl": "https://d3jl769oy69y7b.cloudfront.net/2021/05/sharon-blog.jpg"
                        },
                        {
                            "title": "Design Inspiration: Lottie Sliders",
                            "postedAt": "2021-02-25T00:00:00.000Z",
                            "imageUrl": "https://d3jl769oy69y7b.cloudfront.net/2021/05/OG-Image-Lottie-Sliders.jpg"
                        },
                        {
                            "title": "Hernan Torrisi",
                            "postedAt": "2021-02-25T00:00:00.000Z",
                            "imageUrl": "https://d3jl769oy69y7b.cloudfront.net/2021/05/hernan-torrisi-bodymovin.jpg"
                        },
                        {
                            "title": "Team LottieFiles: Evandro Hoffmann, Head of Mobile",
                            "postedAt": "2021-02-23T00:00:00.000Z",
                            "imageUrl": "https://d3jl769oy69y7b.cloudfront.net/2021/05/evandro-blog.jpg"
                        }
                    ]
                }
            }
        }
        """.data(using: .utf8)!
        
        let response = try! JSONDecoder().decode(BlogsResponse.self, from: input)
        return response
    }
}
