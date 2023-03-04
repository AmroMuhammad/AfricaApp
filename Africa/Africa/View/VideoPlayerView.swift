//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Amr Muhammad on 05/03/2023.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var videoSelected:String
    var videoTitle:String
    
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(filename: videoSelected, fileFormat: "mp4")){
//                Text(videoTitle)
                //can add views inside videoPlayer
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32,height: 32)
                    .padding(.top,6)
                    .padding(.horizontal,8)
                ,alignment: .topLeading
            )
        }
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle,displayMode: .inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected:"lion", videoTitle: "lion")
        }
    }
}
