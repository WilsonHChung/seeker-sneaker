//
//  ConfirmationView.swift
//  seeker-sneaker
//
//  Created by Dominic Gutierrez on 4/28/21.
//

import SwiftUI

struct ConfirmationView: View {
    var type: String = "Purchase"
    var size: Double = 7.5
    var product: Feed = feedData[0]
    var amount: Int = 450 
    
    var body: some View {
        VStack{
            ScrollView{
                
                Text(String(format: "%@ Confirmed", type))
                    .font(.largeTitle)
                
                HStack {
                    Text(String(format: "%@ \nSize: %.1f", product.title.capitalized, size))
                        .font(.body)
                        .padding()
                        .multilineTextAlignment(.center)
                    Image(product.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .padding(.horizontal, 20)
                Text(String(format: "$%i", amount))
                    .font(.largeTitle)
                    .accentColor(.green)
                Text(String(format: "Your %@ has been entered into our database. Let us handle the rest. Thank you for using Seeker Sneaker!", type.lowercased()))
                    .padding(.vertical, 40)
                    .padding(.horizontal, 20)
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.leading)
                    .font(.title)
                // Enter the transaction of type "type" and amount
                // "amount" for product "product" of size "size" into
                // sthe database
            }
        }
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView()
    }
}

