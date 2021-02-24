//
//  PlaylistRepository.swift
//  VideoPlayListTesting
//
//  Created by Ino Gamalinda on 2/23/21.
//

import Foundation

protocol PlaylistRepository {
    func fetchPlaylist() -> Playlist
    func getPlaylist() -> Playlist
}
