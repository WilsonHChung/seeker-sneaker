//
//  ImagesView.swift
//  seeker-sneaker
//
//  Created by Dominic Gutierrez on 3/3/21.
//

import SwiftUI

struct ImagesView: View {
    var feed: Feed = feedData[0]
    var body: some View {
        Image(feed.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct ImagesView_Previews: PreviewProvider {
    static var previews: some View {
        ImagesView()
    }
}
