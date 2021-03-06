//
//  FeaturedAnimationsResponseTests.swift
//  LottieFilesTests
//
//  Created by AD0502-ADE-MB-1 on 11/03/2022.
//

import XCTest
@testable import LottieFiles

class FeaturedAnimationsResponseTests: XCTestCase {

    func testFeaturedAnimationResponse_givenJSON_itShouldDecode() {
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
                        "name": "?????????????? ????????????"
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
                },
                {
                    "id": 62139,
                    "bgColor": "#FFFFFF",
                    "lottieUrl": "https://assets8.lottiefiles.com/private_files/lf30_xlitbkvx.json",
                    "gifUrl": "https://assets7.lottiefiles.com/render/kopffxzb.gif",
                    "videoUrl": "https://assets7.lottiefiles.com/render/kopffxzb.mp4",
                    "imageUrl": "https://assets6.lottiefiles.com/render/kopffxzb.png",
                    "createdAt": "2021-05-15T00:49:15.000Z",
                    "name": "Hamburger",
                    "createdBy": {
                        "avatarUrl": "https://assets8.lottiefiles.com/avatars/300_6046a97c759a5.jpg",
                        "name": "Brian Oliveira"
                    }
                },
                {
                    "id": 62128,
                    "bgColor": "#FFFFFF",
                    "lottieUrl": "https://assets4.lottiefiles.com/packages/lf20_d55shthp.json",
                    "gifUrl": "https://assets1.lottiefiles.com/render/kopfc05a.gif",
                    "videoUrl": "https://assets1.lottiefiles.com/render/kopfc05a.mp4",
                    "imageUrl": "https://assets2.lottiefiles.com/render/kopfc05a.png",
                    "createdAt": "2021-05-14T17:48:45.000Z",
                    "name": "Save button micro animation",
                    "createdBy": {
                        "avatarUrl": "https://assets6.lottiefiles.com/avatars/300_609be98351a7b.jpg",
                        "name": "Risa Nakajima"
                    }
                },
                {
                    "id": 62094,
                    "bgColor": "#FFFFFF",
                    "lottieUrl": "https://assets1.lottiefiles.com/packages/lf20_myfpkodn.json",
                    "gifUrl": "https://assets5.lottiefiles.com/render/kopesukl.gif",
                    "videoUrl": "https://assets5.lottiefiles.com/render/kopesukl.mp4",
                    "imageUrl": "https://assets10.lottiefiles.com/render/kopesukl.png",
                    "createdAt": "2021-05-14T08:29:00.000Z",
                    "name": "loading",
                    "createdBy": {
                        "avatarUrl": "https://assets7.lottiefiles.com/avatars/300_5c667aee365c7.jpg",
                        "name": "?????????"
                    }
                },
                {
                    "id": 62077,
                    "bgColor": "#FFFFFF",
                    "lottieUrl": "https://assets2.lottiefiles.com/packages/lf20_agqsbtmj.json",
                    "gifUrl": "https://assets2.lottiefiles.com/render/konw2kkc.gif",
                    "videoUrl": "https://assets2.lottiefiles.com/render/konw2kkc.mp4",
                    "imageUrl": "https://assets4.lottiefiles.com/render/konw2kkc.png",
                    "createdAt": "2021-05-14T02:51:09.000Z",
                    "name": "Circle animation",
                    "createdBy": {
                        "avatarUrl": "https://assets2.lottiefiles.com/avatars/300_5e3cb3772dd90.jpg",
                        "name": "Micchel K"
                    }
                },
                {
                    "id": 62076,
                    "bgColor": "#FFFFFF",
                    "lottieUrl": "https://assets4.lottiefiles.com/packages/lf20_bgujwnt9.json",
                    "gifUrl": "https://assets1.lottiefiles.com/render/konw1m9g.gif",
                    "videoUrl": "https://assets1.lottiefiles.com/render/konw1m9g.mp4",
                    "imageUrl": "https://assets8.lottiefiles.com/render/konw1m9g.png",
                    "createdAt": "2021-05-14T02:27:55.000Z",
                    "name": "Hola",
                    "createdBy": {
                        "avatarUrl": "https://assets2.lottiefiles.com/avatars/300_5f8d40b2bcae8.jpg",
                        "name": "Esteban Barrios"
                    }
                },
                {
                    "id": 62075,
                    "bgColor": "#FFFFFF",
                    "lottieUrl": "https://assets9.lottiefiles.com/packages/lf20_t0mvxlwu.json",
                    "gifUrl": "https://assets5.lottiefiles.com/render/konw1fn1.gif",
                    "videoUrl": "https://assets5.lottiefiles.com/render/konw1fn1.mp4",
                    "imageUrl": "https://assets9.lottiefiles.com/render/konw1fn1.png",
                    "createdAt": "2021-05-14T02:11:09.000Z",
                    "name": "Teen Walking",
                    "createdBy": {
                        "avatarUrl": "https://assets1.lottiefiles.com/avatars/300_607d1cab0a084.jpg",
                        "name": "Alison Santos"
                    }
                },
                {
                    "id": 62056,
                    "bgColor": "#fff",
                    "lottieUrl": "https://assets3.lottiefiles.com/private_files/lf30_x8dH5W.json",
                    "gifUrl": "https://assets6.lottiefiles.com/render/konvus33.gif",
                    "videoUrl": "https://assets6.lottiefiles.com/render/konvus33.mp4",
                    "imageUrl": "https://assets3.lottiefiles.com/render/konvus33.png",
                    "createdAt": "2021-05-13T19:23:38.000Z",
                    "name": "Loading",
                    "createdBy": {
                        "avatarUrl": "https://assets5.lottiefiles.com/avatars/300_5c9e20b9b722f.jpg",
                        "name": "Carlos Perez ????"
                    }
                }
            ]
        }
        }
        }
        """.data(using: .utf8)!
        
        do {
            let response = try JSONDecoder().decode(FeaturedAnimationsResponse.self, from: input)
            XCTAssertNotNil(response)
        } catch {
            XCTFail("decoding error: \(error)")
        }
    }
}
