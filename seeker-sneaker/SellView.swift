//
//  SellView.swift
//  seeker-sneaker
//
//  Created by Dominic Gutierrez on 4/27/21.
//

import SwiftUI

struct SellView: View {
    var size: Double = 7.5
    var product: Feed = feedData[0]
    var lowest_ask: Int = 450 // obtain from db
    var highest_offer: Int = 400 // obtain from db
    @State var asking = false
    @State private var ask = 2000.0
    @State private var isEditing = false

    var body: some View {
        VStack{
            ScrollView{
                Text(product.title.capitalized)
                    .font(.largeTitle)
                    .padding(.vertical, 20)
                    .multilineTextAlignment(.center)
                
                if size == floor(size) {
                    Text(String(format: "Size %.0f", size))
                        .font(.title)
                } else {
                    Text(String(format: "Size %.1f", size))
                        .font(.title)
                }
                
                
                Image(product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack {
                    if !asking {
                        NavigationLink(
                        destination:
                        ConfirmationView(type: "Sale", size: size, product: product, amount: highest_offer)){
                            Text(String(format: "Sell Now for $%i", highest_offer))
                                .font(.title)
                                .accentColor(.green)
                        }
                        Text("or")
                            .font(.title)
                            .padding(.vertical, 10)
                    }
                    Button(action: {
                        self.asking.toggle()
                    }) {
                        if !asking {
                        Text("Place an Ask")
                            .font(.title)
                            .accentColor(.orange)
                        } else {
                            Text(String(format: "Cancel Ask"))
                                .font(.title)
                                .accentColor(.red)
                        }
                    }
                    if asking {
                        Slider(value: $ask,
                               in: Double(highest_offer)+5.0...2000.0,
                               step: 5,
                               onEditingChanged: {
                                editing in
                                isEditing = editing
                               })
                            .accentColor(.green)
                            .padding(.horizontal, 30)
                        
                        Text(String(format: "Lowest Ask: $%i", lowest_ask))
                            .padding(.top, 20)
                            
                        
                        Text(String(format: "Your Ask: $%.0f", ask))
                            .padding(.bottom, 5)
                        
                        Text(String(format: "Highest Offer: $%i", highest_offer))
                            .padding(.bottom, 20)
                        
                        NavigationLink(
                        destination:
                        ConfirmationView(type: "Ask", size: size, product: product, amount: Int(ask))){
                            Text("Submit")
                                .font(.title)
                                .padding(.vertical, 5)
                                .accentColor(.green)
                        }
                    }
                    
                }
                
            }
        }
    }
}

struct SellView_Previews: PreviewProvider {
    static var previews: some View {
        SellView()
    }
}
