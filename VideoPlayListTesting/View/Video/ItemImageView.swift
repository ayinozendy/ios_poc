//
//  ItemImageView.swift
//  VideoPlayListTesting
//
//  Created by Ino Gamalinda on 2/22/21.
//

import Foundation
import SwiftUI
import URLImage

struct ItemImageView: View {
    var options = URLImageService.shared.defaultOptions
    var imageUrlString = String()
    var imageUrl : URL {
        get {
            getUrl(imageUrlString)
        }
    }
    
    var body: some View {
        URLImage(url:  imageUrl, options: options) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
        }
    }
}

extension ItemImageView {
    func getUrl(_ stringUrl: String) -> URL {
        URL(string: stringUrl) ?? URL(string: "")!
    }
}
