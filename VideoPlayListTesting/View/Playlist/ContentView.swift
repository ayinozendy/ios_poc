//
//  ContentView.swift
//  VideoPlayListTesting
//
//  Created by Ino Gamalinda on 2/22/21.
//

import SwiftUI
import URLImage

struct ContentView: View {
    @ObservedObject var viewModel = PlaylistViewModel()
    
    var body: some View {
        List {
            ForEach (viewModel.playlistState.playlist.videos) {vid in
                NavigationLink(destination: VideoViewer(video: vid)) {
                    ItemListView(video: vid)
                }
            }
        }
        .onAppear(perform: {
            URLImageService.shared.cleanup()
            viewModel.fetchPlaylist()
        })
        .navigationTitle(Text("Video Playlist"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
