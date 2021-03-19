//
//  FeedView.swift
//  seeker-sneaker
//
//  Created by Dominic Gutierrez on 3/3/21.
//

import SwiftUI

struct FeedView: View {
    @State var text = ""
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
                            NavigationLink(destination: ProductView(feed: item)){
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

//struct SearchBar: View {
//    @Binding var searchText: String
//    @Binding var isSearching: Bool
//    @Binding var showResults: Bool
//    @Binding var loadSearch: Bool
//
//    var body: some View {
//
//        HStack (spacing: 0) {
//            HStack{
//            TextField("Search", text: $searchText)
//                .padding(.leading, 24)
//            }
//            .frame(height: 4)
//            .padding()
//            .background(Color(.systemGray5))
//            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
//            .padding(.horizontal)
//            .onTapGesture(perform: {
//                isSearching = true
//                showResults = true
//            })
//            .overlay {
//                HStack {
//                    Image(systemName: "magnifyingglass")
//                    Spacer()
//
//
//                    Button(action: {searchText = ""},
//                    label: {
//                        Image(systemName: "xmark.circle.fill")
//                            .padding()
//                            .foregroundColor(.gray)
//                            .opacity(isSearching ? 1 : 0)
//                    })
//                }
//                .padding(.horizontal, 32)
//                .foregroundColor(.gray)
//            }
//            .animation(loadSearch ? .spring() : .none)
//
//            if isSearching {
//                Button(action: {
//                    isSearching = false
//                    searchText = ""
//                    showResults = false
//
//                    UIApplication.shared
//                        .sendAction(#selector(UIResponder .resignFirstResponder), to: nil, from: nil, for: nil)
//                },
//                label: {
//                    Text("Cancel")
//                        .padding(.trailing)
//                        .padding(.leading, 0)
//                }
//                )
//                .transition(.move(edge: .trailing))
//                .animation(.spring())
//            }
//        }
//    }
//}




