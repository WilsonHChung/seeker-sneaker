//
//  ProductView.swift
//  seeker-sneaker
//
//  Created by Dominic Gutierrez on 3/18/21.
//

import SwiftUI

struct ProductView: View {
    @State var expand = false
    @State private var selected_size = 7.5
    var product: Feed = feedData[0]
    var body: some View {
        VStack{
            ScrollView{
                Text(product.title.capitalized)
                    .font(.largeTitle)
                    .padding(.vertical, 20)
                    .multilineTextAlignment(.center)
                HStack{
                    if !expand {
                        Text("Size:")
                    }
                    Button(action: {
                        self.expand.toggle()
                    }) {
                        if expand {
                            Text("Select")
                        }
                        else if selected_size == floor(selected_size) {
                            Text(String(format: "%.0f", selected_size))
                        } else {
                            Text(String(format: "%.1f", selected_size))
                        }
                    }
                }
                if expand {
                Picker("Size", selection: $selected_size){
                    // should iterate through sizes from db
                    Text("7.5").tag(7.5)
                    Text("8").tag(8.0)
                    Text("8.5").tag(8.5)
                    Text("9").tag(9.0)
                    Text("9.5").tag(9.5)
                    Text("10").tag(10.0)
                    Text("10.5").tag(10.5)
                    Text("11").tag(11.0)
                    Text("11.5").tag(11.5)
                    Text("12").tag(12.0)
                }
                .pickerStyle(WheelPickerStyle())
                .padding(.vertical, -10)
                }
                
                HStack(spacing: 50){
                    NavigationLink(destination: BuyView(size: selected_size, product: product)){
                        VStack{
                        Text("Lowest Ask")
                        // Price for size from db
                        Text("$450")
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .border(Color.green, width: 3)
                    }
                    
                    NavigationLink(destination: SellView(size: selected_size, product: product)){
                        VStack{
                        Text("Highest Offer")
                        // Price for size from db
                        Text("$400")
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .border(Color.red, width: 3)
                    }
                }
                .padding(.vertical, 20)
                
                Image(product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                // Visualization of Past Sales
            }
            FooterButtons(in_search: false)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}

