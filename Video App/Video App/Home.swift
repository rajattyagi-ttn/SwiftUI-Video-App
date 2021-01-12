//
//  Home.swift
//  Video App
//
//  Created by Rajat Tyagi on 08/01/21.
//  Copyright © 2021 Rajat Tyagi. All rights reserved.
//

import SwiftUI

struct Home: View {
    let titles = [VideoTitle(title: "Trending"),VideoTitle(title: "Popular"),VideoTitle(title: "Best Drama"),VideoTitle(title: "Popular"),VideoTitle(title: "Kids")]
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(self.titles) { videoTitle in
                    VStack(alignment: .leading) {
                        VideosRow(categoryName: videoTitle.title).frame(height: 320)
                            .padding(.top)
                            .padding(.bottom)
                            .padding(.leading,20)
                    }
                }
            }.navigationBarTitle("Videos")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
