//
//  BuyView.swift
//  seeker-sneaker
//
//  Created by Dominic Gutierrez on 4/27/21.
//

import SwiftUI

struct BuyView: View {
    var size: Double = 7.5
    var product: Feed = feedData[0]
    var price: Int = 450 // obtain from db
    var highest_offer: Int = 400 // obtain from db
    @State var offering = false
    @State private var offer = 0.0
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
                    if !offering {
                        NavigationLink(
                            destination:
                            ConfirmationView(type: "Purchase", size: size, product: product, amount: price)){
                            Text(String(format: "Buy Now for $%i", price))
                                .font(.title)
                                .accentColor(.green)
                        }
                        Text("or")
                            .font(.title)
                            .padding(.vertical, 10)
                    }
                    Button(action: {
                        self.offering.toggle()
                    }) {
                        if !offering {
                        Text("Make an Offer")
                            .font(.title)
                            .accentColor(.orange)
                        } else {
                            Text(String(format: "Cancel Offer"))
                                .font(.title)
                                .accentColor(.red)
                        }
                    }
                    if offering {
                        Slider(value: $offer,
                               in: 0...(Double(price) - 1),
                               step: 5,
                               onEditingChanged: {
                                editing in
                                isEditing = editing
                               })
                            .accentColor(.green)
                            .padding(.horizontal, 30)
                        
                        Text(String(format: "Highest Offer: $%i", highest_offer))
                            .padding(.top, 20)
                        
                        Text(String(format: "Your Offer: $%.0f", offer))
                            .padding(.bottom, 5)
                        
                        Text(String(format: "Lowest Ask: $%i", price))
                            .padding(.bottom, 20)
                        
                        NavigationLink(
                            destination:
                                ConfirmationView(type: "Offer", size: size, product: product, amount: Int(offer))){
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

struct BuyView_Previews: PreviewProvider {
    static var previews: some View {
        BuyView()
    }
}
