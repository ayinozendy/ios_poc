//
//  ItemListView.swift
//  VideoPlayListTesting
//
//  Created by Ino Gamalinda on 2/22/21.
//

import Foundation
import SwiftUI

struct ItemListView: View {
    var video: Video
    var body: some View {
        HStack {
            ItemImageView(imageUrlString: video.thumbnailURL)
            VStack(alignment: .leading) {
                Text(video.title)
                    .lineLimit(1)
                    .truncationMode(.tail)
                Text(video.author)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .truncationMode(.tail)
                Text(video.playListDescription)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .truncationMode(.tail)
            }
            .layoutPriority(1)
        }
    }
}
