//
//  SearchButton.swift
//  seeker-sneaker
//
//  Created by Dominic Gutierrez on 5/18/21.
//

import SwiftUI

struct FooterButtons: View {
    var in_search: Bool = false
    var in_profile: Bool = false
    @State private var search_pressed = false
    @State private var transactions_pressed = false
    var body: some View {
        HStack{
            if in_search == false {
                NavigationLink(
                destination: FeedView()){
                    Image("search_icon")
                        .resizable()
                        .frame(width:90, height: 70)
                }
                .padding(.horizontal, 50)
            } else {
                Image("search_selected")
                    .resizable()
                    .frame(width:75, height: 70)
                    .padding(.horizontal, 50)
            }
            
            if in_profile == false {
                NavigationLink(
                destination: ProfileView()){
                    Image("profile_icon")
                        .resizable()
                        .frame(width:90, height: 70)
                }
                .padding(.horizontal, 50)
            } else {
                Image("profile_selected")
                    .resizable()
                    .frame(width:100, height: 70)
                    .padding(.horizontal, 50)
            }
            
//            NavigationLink(
//            destination: ProfileView()){
//                Image("profile_icon")
//                    .resizable()
//                    .frame(width:90, height: 70)
//            }
//            .padding(.horizontal, 50)
        }
        .padding(.vertical, 0)
        .padding(.horizontal, 50)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
    }
}

struct FooterButtons_Previews: PreviewProvider {
    static var previews: some View {
        FooterButtons()
    }
}

// Way to Navigate Without Back Button (Not Used, Reference)
extension View {
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                
                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
    }
}
