//
//  VideoItem.swift
//  Video App
//
//  Created by Rajat Tyagi on 06/01/21.
//  Copyright © 2021 Rajat Tyagi. All rights reserved.
//

import SwiftUI

struct VideoItem: View {
    
    @State var vid: Video
    var baseImageUrl = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/"
    @State var vidImage: UIImage = UIImage(systemName: "photo.fill")!
    
    var body: some View {
        GeometryReader { metrics in
            
            VStack(alignment: .leading, spacing: 10.0) {
                Image(uiImage: self.vidImage)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: metrics.size.width * 0.99, height: 150)
                    .cornerRadius(10.0)
                    .shadow(radius: 10.0)
                
                VStack(alignment: .leading, spacing: 2.0) {
                    Text(self.vid.title)
                        .foregroundColor(.primary)
                        .font(.headline)
                    Text(self.vid.videoDescription)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                        .frame(height: 20)
                }
                
            }.onAppear {
                let url = URL(string: self.baseImageUrl + self.vid.thumb)
                let task = URLSession.shared.dataTask(with: url!) { (data, _, _) in
                    guard let loadedData = data else {
                        debugPrint("Data nhi aaya")
                        return }
                    DispatchQueue.main.async {
                        guard let loadedImage = UIImage(data: loadedData) else {
                            return
                        }
                        self.vidImage = loadedImage
                    }
                }
                task.resume()
            }

        }
    }
}

struct VideoItem_Previews: PreviewProvider {
    static var previews: some View {
        VideoItem(vid: Video(id: UUID(), videoDescription: "Big Buck Bunny tells the story of a giant rabbit with a heart bigger than himself. When one sunny day three rodents rudely harass him, something snaps... and the rabbit ain't no bunny anymore! In the typical cartoon tradition he prepares the nasty rodents a comical revenge.\n\nLicensed under the Creative Commons Attribution license\nhttp://www.bigbuckbunny.org", source: "sdsadsad", subtitle: .byGarage419, thumb: "images/BigBuckBunny.jpg", title: "Testing"))
    }
}
