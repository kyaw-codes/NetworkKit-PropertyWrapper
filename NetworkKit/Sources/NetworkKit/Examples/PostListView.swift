//
//  PostListView.swift
//  
//
//  Created by Kyaw Zay Ya Lin Tun on 20/05/2023.
//

import SwiftUI

struct PostListView: View {
    @RemoteData(endpoint: .posts)
    var postResult: StatefulResult<[Post], NetworkError>?
    
    var body: some View {
        StatefulResult.unwrapped(postResult) { posts in
            List(posts) { post in
                PostView(post)
            }
        }
        .navigationTitle("Posts")
    }
    
    @ViewBuilder
    private func PostView(_ post: Post) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("# \(post.id)")
                .foregroundColor(.pink)
                .padding(.horizontal)
                .padding(.vertical, 4)
                .background(RoundedRectangle(cornerRadius: 12).fill(Color.pink.opacity(0.2)))
            Text(post.title.capitalized)
                .font(.headline)
            Text(post.body)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostListView()
        }
        .environment(\.urlSession, .default)
    }
}
