//
//  ProductView.swift
//  seeker-sneaker
//
//  Created by Dominic Gutierrez on 3/18/21.
//

import SwiftUI

struct ProductView: View {
    var feed: Feed = feedData[0]
    var body: some View {
        VStack{
            ScrollView{
                Text(feed.title)
                    .font(.largeTitle)
                    .padding(.vertical, 20)
                
                HStack{
                    Text("Lowest Ask")
                        .padding(.horizontal, 60)
                        .padding(.vertical, 50)
                    Text("Highest Offer")
                        .padding(.horizontal, 50)
                        .padding(.vertical, 50)
                }
                
                Image(feed.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
