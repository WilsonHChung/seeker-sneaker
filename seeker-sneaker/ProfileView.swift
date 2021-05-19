//
//  TransactionsView.swift
//  seeker-sneaker
//
//  Created by Dominic Gutierrez on 5/18/21.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            ScrollView{
                
                Text("Wilson's Profile")
                    .font(.largeTitle)
            }
            FooterButtons(in_profile: true)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
