//
//  VideoDetailedView.swift
//  Video App
//
//  Created by Rajat Tyagi on 11/01/21.
//  Copyright © 2021 Rajat Tyagi. All rights reserved.
//

import SwiftUI
import AVKit

struct VideoDetailedView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var vidItem: Video
    @State var vidImage: UIImage = UIImage(systemName: "bell")!
    @State var vidPlayer: player
    
    var body: some View {
        
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    self.vidPlayer.frame(height: UIScreen.main.bounds.height/2.5)
                    Text(self.vidItem.title).font(.title).bold().padding(.leading, 20)
                    Text(self.vidItem.subtitle.rawValue).padding(.leading,20)
                    Text(self.vidItem.videoDescription).padding(.top,20).padding(.leading,20)
                        .padding(.trailing,10).foregroundColor(.gray)

                    Spacer()
                }
            }.navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
            self.vidPlayer.stopPlayer()
            print("Button Tapped")
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.left.circle")
                Text("Go Back")
            }
        })
    }
}

struct VideoDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailedView(vidItem: Video(id: UUID(), videoDescription: "Big Buck Bunny tells the story of a giant rabbit with a heart bigger than himself. When one sunny day three rodents rudely harass him, something snaps... and the rabbit ain't no bunny anymore! In the typical cartoon tradition he prepares the nasty rodents a comical revenge.\n\nLicensed under the Creative Commons Attribution license\nhttp://www.bigbuckbunny.org", source: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4", subtitle: .byGarage419, thumb: "images/BigBuckBunny.jpg", title: "Testing"), vidPlayer: player(url: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4") )
    }
}

struct player: UIViewControllerRepresentable {
    
    var url: String
    let controller = AVPlayerViewController()
    func makeUIViewController(context: UIViewControllerRepresentableContext<player>) -> AVPlayerViewController {
        
        let player1 = AVPlayer(url: URL(string: self.url)!)
        self.controller.player = player1
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<player>) {
        
    }
    
    func stopPlayer() {
        controller.player?.pause()
    }
}
