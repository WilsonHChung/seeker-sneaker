//
//  ContentView.swift
//  seeker-sneaker
//
//  Created by Wilson Chung on 2/17/21.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

struct ContentView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    @State var authentiationDidFail: Bool = true
    @State var authenticationDidSucceed: Bool = true

    
    var body: some View {
        VStack {
            HelloText()
            UserImage()
            UsernameBar(username: $username)
            PasswordBar(password: $password)
            if authentiationDidFail {
                Text("Wrong username or password. Try again.")
                    .offset(y: -10)
                    .foregroundColor(.red)
            }
            LoginButton()
                
        }
        .padding()
        if authenticationDidSucceed {
            Text("Login succeeded!")
                .font(.headline)
                .frame(width: 250, height: 80)
                .background(Color.yellow)
                .cornerRadius(20.0)
                .animation(Animation.default)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HelloText: View {
    var body: some View {
        Text("Seeker Sneaker")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct UserImage: View {
    var body: some View {
        Image("userImage")
            .resizable()
            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct UsernameBar: View {
    
    @Binding var username: String
    
    var body: some View {
        TextField("Username", text: $username)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct PasswordBar: View {
    
    @Binding var password: String
    
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct LoginButton: View {
    var body: some View {
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.black)
            .cornerRadius(35.0)
    }
}
