//
//  FeedViewModel.swift
//  TikTokTutorial
//
//  Created by Brandon Jemison on 12/28/23.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    let videoURLS = [
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"
    ]
    
    init() {
    fetchPost()
    }
    
    func fetchPost() {
        self.posts = [
            .init(id: NSUUID().uuidString, videoURL: videoURLS[0]),
            .init(id: NSUUID().uuidString, videoURL: videoURLS[1]),
            .init(id: NSUUID().uuidString, videoURL: videoURLS[2]),
            .init(id: NSUUID().uuidString, videoURL: videoURLS[3])
        
        
        ]
    }
}
