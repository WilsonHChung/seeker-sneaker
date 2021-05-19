//
//  HomeView.swift
//  seeker-sneaker
//
//  Created by Dominic Gutierrez on 3/18/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Seeker Sneaker")
                    .padding(.vertical, -200)
                    .font(.system(size: 50, design: .rounded))
                Image(feedData[0].image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                NavigationLink(destination: FeedView()){
                    Text("Search")
                        .fontWeight(.bold)
                        .overlay(
                            Capsule(style: .continuous)
                                    .stroke(lineWidth: 2.0)
                                    .padding(.horizontal, -10)
                                    .padding(.vertical, -5)
                                    
                        )
                        .font(.system(size: 20, design: .rounded))
                        .foregroundColor(.green)
                        
                }
                .animation(.easeIn(duration: 0))
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
