//
//  FeedView.swift
//  seeker-sneaker
//
//  Created by Dominic Gutierrez on 3/3/21.
//

import SwiftUI
import Firebase

//struct Feed: Identifiable {
//    var id = UUID()
//    var title: String
//    var image: String
//
//}

extension String {
    func load() -> UIImage {
        do {
            guard let url = URL(string: self)
            else {
                return UIImage()
            }
            let data: Data = try
                Data(contentsOf: url)
            
            return UIImage(data: data) ?? UIImage()
        }
        catch {
            
        }
        return UIImage()
    }
}

//var feedData = [] as Array<Feed>


struct FeedView: View {
    
    var i = 0
    

    @State var text = ""
    @State var brand = ""
    @State var name = ""
    @State var imageUrl = ""
    
    @State var brands: [String] = []
    @State var names: [String] = []
    @State var imageUrls: [String] = []
    
    init() {
//        download()
//        storeFeedData()
    }
    

    var body: some View {
        VStack{
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
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}



