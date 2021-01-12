//
//  VideosRow.swift
//  Video App
//
//  Created by Rajat Tyagi on 05/01/21.
//  Copyright © 2021 Rajat Tyagi. All rights reserved.
//

import SwiftUI

struct VideosRow: View {
    @State var vids: [Video] = []
    var categoryName: String

    
    var body: some View {
        GeometryReader { metrics in

            VStack(alignment: .leading) {
                Text(self.categoryName)
                .font(.title)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top) {
                        ForEach(self.vids) { vid in
                            NavigationLink(destination: VideoDetailedView(vidItem: vid, vidPlayer: player(url: vid.source))) {
                                VideoItem(vid: vid)
                                    .frame(width: metrics.size.width * 0.8)
                                    .padding(.trailing, 30)
                            }
                        }.onAppear {

                        }
                    }.frame(height: 300)
                    .onAppear{
                        HttpUtility().getVideosData { (vids) in
                            self.vids = vids
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

struct VideosRow_Previews: PreviewProvider {
    static var previews: some View {
        VideosRow(categoryName: "Test Category")
    }
}
