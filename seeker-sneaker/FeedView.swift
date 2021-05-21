//
//  FeedView.swift
//  seeker-sneaker
//
//  Created by Dominic Gutierrez on 3/3/21.
//

import SwiftUI
import Firebase

struct FeedView: View {
    
    var i = 0
    
    @State var text = ""
    @State var brand = ""
    @State var name = ""
    @State var imageUrl = ""
    
    @State var brands: [String] = []
    @State var names: [String] = []
    @State var imageUrls: [String] = []
    

    var body: some View {
        VStack{
            
            HStack {
                Text("Seeker Sneaker")
                    .font(.title)
                    .offset(x: -45)
                NavigationLink(destination: Transactions()){
                    VStack{
                        Text("Profile")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 70, height: 40)
                            .background(Color.black)
                            .cornerRadius(35.0)
                    }
                }
                .offset(x: 45)
            }
        
            
            SearchBar(text: $text)
            GeometryReader { bounds in
                ScrollView {
                    LazyVGrid (columns:
                                [GridItem(.adaptive(minimum: bounds.size.width / 3 - 1.2), spacing: 1.2)],
                               spacing: 1) {
                        ForEach(feedData.filter({"\($0)".contains(text.lowercased()) || text.isEmpty})) {
                            item in
                            NavigationLink(destination: ProductView(product: item)){
                                ImagesView(feed: item)
                                    .frame(width: bounds.size.width / 3 - 0.6, height: bounds.size.width / 3 - 0.6)
                            }
                        }
                    }
                    .animation(.easeOut(duration: 0.3))

                }
            }

    }
        .navigationBarHidden(true)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}



