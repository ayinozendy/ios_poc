//
//  Playlist.swift
//  VideoPlayListTesting
//
//  Created by Ino Gamalinda on 2/22/21.
//

import Foundation

struct Playlist: Decodable {
    let videos: [Video]

    enum CodingKeys: String, CodingKey {
        case videos = "play_list"
    }
}
