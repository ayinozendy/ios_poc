//
//  Video.swift
//  VideoPlayListTesting
//
//  Created by Ino Gamalinda on 2/22/21.
//

import Foundation

struct Video : Identifiable, Decodable {
    let id: Int
    let title, author, playListDescription, videoURL: String
    let thumbnailURL: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, author
        case playListDescription = "description"
        case videoURL = "video_url"
        case thumbnailURL = "thumbnail_url"
    }
}
