//
//  HttpUtility.swift
//  Video App
//
//  Created by Rajat Tyagi on 05/01/21.
//  Copyright © 2021 Rajat Tyagi. All rights reserved.
//

import Foundation

class HttpUtility {

    
    func getVideosData(completion: @escaping ([Video]) -> () ) {
        let videosApiUrl = "https://5fe4bc564b7a6000172277f3.mockapi.io/sampleVideos"
        
        URLSession.shared.dataTask(with: URL(string: videosApiUrl)!) { (responseData, _, _) in
            
                let decoder = JSONDecoder()
                
                do {
                    let result = try decoder.decode([VideosResponseElement].self, from: responseData!)
                    
                    for VideoResult in result {
                        let videosData = VideoResult.videos
                        
                        DispatchQueue.main.async {
                            completion(videosData)
                        }
                    }
                }
                catch let error {
                    print("error")
                }
            
        }.resume()
        
    }
    
}
