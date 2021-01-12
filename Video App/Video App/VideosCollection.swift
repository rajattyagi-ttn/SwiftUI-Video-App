// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let videosResponse = try? newJSONDecoder().decode(VideosResponse.self, from: jsonData)

import Foundation

// MARK: - VideosResponseElement
struct VideosResponseElement: Codable {
    let name: String
    let videos: [Video]
}

// MARK: - Video
struct Video: Codable,Identifiable {

    var id = UUID()
    let videoDescription: String
    let source: String
    let subtitle: Subtitle
    let thumb, title: String

    enum CodingKeys: String, CodingKey {
        case videoDescription = "description"
        case source, subtitle, thumb, title
    }
}

enum Subtitle: String, Codable {
    case byBlenderFoundation = "By Blender Foundation"
    case byGarage419 = "By Garage419"
    case byGoogle = "By Google"
}

typealias VideosResponse = [VideosResponseElement]


//
//struct VideosCollection {
//    private let httpUtility: HttpUtility
//
//    init(_httpUtility: HttpUtility) {
//        httpUtility = _httpUtility
//    }
//
//    func getVideosData(completion: @escaping ([Video]) -> () ) {
//        let videosApiUrl = "https://5fe4bc564b7a6000172277f3.mockapi.io/sampleVideos"
//        
//        httpUtility.getApiData(requestUrl: URL(string: videosApiUrl)!, resultType: VideosResponse.self) { (videoResult) in
//            if(videoResult?.count != 0) {
//                for videoRes in videoResult! {
//                    let videosData = videoRes.videos
//                    DispatchQueue.main.async {
//                        completion(videoRes.videos)
//                    }
//                }
//            }
//
//        }
//    }
//}



