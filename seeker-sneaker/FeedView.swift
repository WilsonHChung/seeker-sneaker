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
//                                Image(uiImage:imageUrls[0].load())
//                                    .resizable()
//                                    .frame(width: bounds.size.width / 3 - 0.6, height: bounds.size.width / 3 - 0.6)
//
//                                Image(uiImage:imageUrls[1].load())
//                                    .resizable()
//                                    .frame(width: bounds.size.width / 3 - 0.6, height: bounds.size.width / 3 - 0.6)
                                
                            }
                        }
                    }
                    .animation(.easeOut(duration: 0.3))

                }
            }
    
//            HStack {
////                TextField("Enter your Name", text: $name)
//                Button(action: {upload() }) {
//                    Text("Upload")
//                }
//                }.onAppear(perform: {
//                    download()
//                })
//
//                List(0..<names.count, id: \.self) { i in
//                    Text(names[i])
//                }
//                List(0..<imageUrls.count, id: \.self) { i in
//                    Text(imageUrls[i])
//                }
//            }
    }
    }

//    func upload() {
//        let db = Firestore.firestore()
//        db.collection("sneak").document().setData(["name":name])
//    }
//
//        func download() {
//            let db = Firestore.firestore()
//            db.collection("sneakers").addSnapshotListener {(snap, err) in
//                if err != nil {
//                    print("There is an error downloading content from the database.")
//                    return
//                }
//
//
//
//
//                for i in snap!.documentChanges {
//                    let documentId = i.document.documentID
//                    let brand = i.document.get("brand")
//                    let name = i.document.get("name")
//                    let imageUrl = i.document.get("imageUrl")
////                    feedData += [Feed(title: "\(name)", image: "\(imageUrl)")]
//
//
//
////                    feedData += [Feed(title: "air jordan 1 bred toe", image: "bred_toe"), Feed(title: "air jordan 1 fragment",
////                             image: "frag_1")]
//
//
//
//
//                    DispatchQueue.main.async {
//                        brands.append("\(brand!)")
//                        names.append("\(name!)")
//                        imageUrls.append("\(imageUrl!)")
//
//                    }
//
//
//                }
//
//                feedData += [Feed(title: "air jordan 1 bred toe", image: "bred_toe"), Feed(title: "air jordan 1 fragment", image: "frag_1")]
////                feedData += [Feed(title: "air jordan 1 bred toe", image: "bred_toe"), Feed(title: "\(names[0])", image: "\(imageUrls[0])")]
//
////                feedData += [Feed(title: "\(name)", image: "\(imageUrl)")]
////                print(feedData.title)
//
//
//            }
//        }
//    func storeFeedData() {
//        feedData = [Feed(title: name, image: imageUrl)]
//    }

}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}



