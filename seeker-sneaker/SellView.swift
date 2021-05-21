//
//  SellView.swift
//  seeker-sneaker
//
//  Created by Dominic Gutierrez on 4/27/21.
//

import SwiftUI
import Firebase

struct SellView: View {
    
    @State var highestbid = ""
    @State var pricehistory = ""
    @State var store_value = ""

    @State var highestbids: [String] = []
    @State var pricehistories: [String] = []
    
    var size: Double = 7.5
    var product: Feed = feedData[0]
    var lowest_ask: Int = 450 // obtain from db
    var highest_offer: Int = 250 // obtain from db
    @State var asking = false
    @State private var ask = 2000.0
    @State private var isEditing = false

    var body: some View {
        VStack{
            ScrollView{
<<<<<<< HEAD
                VStack {
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
=======
                VStack {
                    Text(product.title.capitalized)
                        .font(.largeTitle)
                        .padding(.vertical, 20)
                        .multilineTextAlignment(.center)
                    
                    if size == floor(size) {
                        Text(String(format: "Size %.0f", size))
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 112, height: 30)
                            .background(Color.white)
                            .cornerRadius(35.0)
                            .overlay (RoundedRectangle(cornerRadius: 35) .stroke())
                    } else {
                        Text(String(format: "Size %.1f", size))
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 112, height: 30)
                            .background(Color.white)
                            .cornerRadius(35.0)
                            .overlay (RoundedRectangle(cornerRadius: 35) .stroke())
>>>>>>> proto
                    }
                    
                    
                    HStack {
                        Image(product.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }.onAppear(perform: {
                        download()
                    })
                    
                    VStack {
                        if !asking {
                            NavigationLink(
                            destination:
                            ConfirmationView(type: "Sale", size: size, product: product, amount: store_value)){
                                    Text("Sell Now for $\(store_value)")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(width: 185, height: 60)
                                        .background(Color.green)
                                        .cornerRadius(35.0)
                                
                                
                
                            }
                            Text("or")
                                .font(.headline)
                                .padding(.vertical, 10)
                        }
<<<<<<< HEAD
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
=======
                        Button(action: {
                            self.asking.toggle()
                        }) {
                            if !asking {
                            Text("Place an Ask")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 150, height: 60)
                                .background(Color.orange)
                                .cornerRadius(35.0)
                            } else {
                                Text(String(format: "Cancel Ask"))
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 150, height: 60)
                                    .background(Color.red)
                                    .cornerRadius(35.0)
                            }
                        }
                        if asking {
                            Slider(value: $ask,
                                   in: Double(highest_offer)+5.0...3000.0,
                                   step: 5,
                                   onEditingChanged: {
                                    editing in
                                    isEditing = editing
                                   })
>>>>>>> proto
                                .accentColor(.green)
                                .padding(.horizontal, 30)
                            
                                
                            Text(String(format: "Your Ask: $%.0f", ask))
                                .padding(.bottom, 5)
                            
                            Text("Highest Bid: $\(highestbids[0])")
                                .padding(.bottom, 3)
                            
                            NavigationLink(
                                destination:
                                ConfirmationView(type: "Ask", size: size, product: product, amount: String(Int(ask)))){
                                    Text("Submit")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(.vertical, 10)
                                        .frame(width: 150, height: 60)
                                        .background(Color.green)
                                        .cornerRadius(35.0)
                                }
                            }
                        
                        }
                    }
<<<<<<< HEAD
                    Text("\n\n\n\n") // Extra Space
=======
                    .padding(.vertical, -45)

>>>>>>> proto
                }
                }.padding(.vertical, -70)
            }
            FooterButtons(in_search: false)
        }
    

    func upload_latestprice() {
        let db = Firestore.firestore()
        db.collection("transactions").document("air jordan 1 fragment").setData(["latestprice":store_value], merge: true)
    }
    func upload_ask() {
        let db = Firestore.firestore()
        db.collection("transactions").document("air jordan 1 fragment").setData(["lowestask":String(Int(ask))], merge: true)
    }
    func download() {
    
        let db = Firestore.firestore()
        db.collection("transactions").addSnapshotListener {(snap, err) in


        if err != nil {
            print("There is an error downloading content from the database.")
            return
        }

        for i in snap!.documentChanges {
            let documentId = i.document.documentID
            let highestbid = i.document.get("highestbid")
            
            store_value = ("\(highestbid!)")


            DispatchQueue.main.async {
                highestbids.append("\(highestbid!)")
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

