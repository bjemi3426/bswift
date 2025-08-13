//
//  FeedView.swift
//  TikTokTutorial
//
//  Created by Brandon Jemison on 12/28/23.
//

import SwiftUI
import AVKit

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    @State private var scrollPosition: String?
    @State var player = AVPlayer()
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.posts) { post in
                    FeedCell(post: post, player: player)
                        .id(post.id)
                        .onAppear {
                            playInitialVideoIfNecessary()
                        }
                }
            }
            .scrollTargetLayout()
        }
        .scrollPosition(id: $scrollPosition)
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
        .onChange(of: scrollPosition) { oldValue, newValue in
            playVideoOnChangeOfScrollposition(postID: newValue)
        }
    }
    
    func playInitialVideoIfNecessary() {
        guard scrollPosition == nil,
            let post = viewModel.posts.first,
              player.currentItem == nil
        else { return }
        
        let item = AVPlayerItem(url: URL(string: post.videoURL)!)
        
        
    }
    
    func playVideoOnChangeOfScrollposition(postID: String?) {
        guard let currentPost = viewModel.posts.first(where: { $0.id == postID }) else { return }
        
        player.replaceCurrentItem(with: nil)
        let playerItem = AVPlayerItem(url: URL(string: currentPost.videoURL)!)
        player.replaceCurrentItem(with: playerItem)
    }
}

#Preview {
    FeedView()
}
