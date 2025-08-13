//
//  ExplorerView.swift
//  TikTokTutorial
//
//  Created by Brandon Jemison on 12/28/23.
//

import SwiftUI

struct ExplorerView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(0 ..< 20) { user in
                        UserCell()
                            .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Explorer")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top)
        }
    }
}

#Preview {
    ExplorerView()
}
