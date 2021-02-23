//
//  PlaylistViewModel.swift
//  VideoPlayListTesting
//
//  Created by Ino Gamalinda on 2/22/21.
//

import Foundation

class PlaylistViewModel: ObservableObject {
    let jsonUrl = "https://gist.githubusercontent.com/ayinozendy/a1f7629d8760c0d9cd4a5a4f051d111c/raw/6ead19b28382af688e8b4426d2310f0468a2fb5f/playlist.json"
    
    @Published public var playlistState = PlaylistState(playlist: Playlist(videos: []))
    
    func fetchPlaylist() {
        guard let url = URL(string: jsonUrl) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            let result = try! JSONDecoder().decode(Playlist.self , from: data!)
            DispatchQueue.main.async {
                self.playlistState = PlaylistState(playlist: result)
            }
        }.resume()
    }
}

struct PlaylistState {
    var playlist: Playlist
}
