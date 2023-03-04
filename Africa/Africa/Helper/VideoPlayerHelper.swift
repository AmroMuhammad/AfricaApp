//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Amr Muhammad on 05/03/2023.
//

import Foundation
import AVKit

var videoPlayer:AVPlayer?

func playVideo(filename:String,fileFormat:String) -> AVPlayer {
    if let url = Bundle.main.url(forResource: filename, withExtension: fileFormat) {
        videoPlayer = AVPlayer(url: url)
        videoPlayer?.play()
    }
    return videoPlayer!
}
