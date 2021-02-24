//
//  PlaylistViewModel.swift
//  VideoPlayListTesting
//
//  Created by Ino Gamalinda on 2/22/21.
//

import Foundation
import URLImage

class PlaylistViewModel: ObservableObject {
    let jsonUrl = "https://gist.githubusercontent.com/ayinozendy/a1f7629d8760c0d9cd4a5a4f051d111c/raw/6ead19b28382af688e8b4426d2310f0468a2fb5f/playlist.json"
    
    @Published public var playlistState = PlaylistState(state: .initial)
    static var playlistCache : Playlist?
    
    func accept(intent : Intent) {
        switch intent {
        case .loadList:
            URLImageService.shared.cleanup()
            fetchPlaylist()
        case .showList:
            self.dispatchMain {
                guard let data = PlaylistViewModel.playlistCache else {
                    self.playlistState = PlaylistState(state: .errorShowing)
                    return
                }
                self.playlistState = PlaylistState(state: .success(data))
            }
        }
    }
    
    func fetchPlaylist() {
        guard let url = URL(string: jsonUrl) else {return}
        self.playlistState = PlaylistState(state: .loading)
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            do {
                PlaylistViewModel.playlistCache = try JSONDecoder().decode(Playlist.self , from: data!)
                self.dispatchMain {
                    self.playlistState = PlaylistState(state: .doneLoading)
                }
            } catch {
                self.dispatchMain {
                    self.playlistState = PlaylistState(state: .errorLoading)
                }
            }
        }.resume()
    }
    
    func dispatchMain(action: @escaping () -> Void) {
        DispatchQueue.main.async {
            action()
        }
    }
}

struct PlaylistState {
    var state: State
}

enum Intent {
    case loadList
    case showList
}

enum State {
    case initial
    case loading
    case doneLoading
    case success(_ playlist: Playlist)
    case errorLoading
    case errorShowing
}
