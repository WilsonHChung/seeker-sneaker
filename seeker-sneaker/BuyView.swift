//
//  BuyView.swift
//  seeker-sneaker
//
//  Created by Wilson Chung on 4/28/21.
//

import SwiftUI
import Firebase

struct BuyView: View {
    
    @State var lowestask = ""
    @State var pricehistory = ""
    @State var store_value = ""
    
    @State var lowestasks: [String] = []
    @State var pricehistories: [String] = []
    
    var purchased_price: Double = 0
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
                    }
                    
                    HStack {
                        Image(product.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        
                    }.onAppear(perform: {
                        download()
                    })
                    
                    VStack {
                        if !offering {

                            NavigationLink(
                            destination:
                            ConfirmationView(type: "Purchase", size: size, product: product, amount: store_value)){
                                    Text("Buy Now for $\(store_value)")
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
                        Button(action: {
                            self.offering.toggle()
                        }) {
                            if !offering {
                            Text("Make an Offer")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 150, height: 60)
                                .background(Color.orange)
                                .cornerRadius(35.0)
                            } else {
                                Text(String(format: "Cancel Offer"))
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 150, height: 60)
                                    .background(Color.red)
                                    .cornerRadius(35.0)
                            }
                        }
                        if offering {
                                                    
                            Slider(value: $offer,
                                   in: 0...(Double(price) + 400),
                                   step: 5,
                                   onEditingChanged: {
                                    editing in
                                    isEditing = editing
                                   })
                                .accentColor(.green)
                                .padding(.horizontal, 30)
                        

                            Text(String(format: "Your Offer: $%.0f", offer))
                                .padding(.bottom, 5)

                            Text("Lowest Ask: $\(store_value)")
                                .padding(.bottom, 3)
                            
                            
                            NavigationLink(
                                destination:
                                    ConfirmationView(type: "Offer", size: size, product: product, amount: String(Int(offer)))){
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
                .padding(.vertical, -45)

                
            }
        }
    }
    func upload_latestprice() {
        let db = Firestore.firestore()
        db.collection("transactions").document("air jordan 1 fragment").setData(["latestprice":store_value], merge: true)
    }
    func upload_bid() {
        let db = Firestore.firestore()
        db.collection("transactions").document("air jordan 1 fragment").setData(["highestbid":String(Int(offer))], merge: true)
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
            let lowestask = i.document.get("lowestask")
            let pricehistory = i.document.get("pricehistory")
            
            store_value = ("\(lowestask!)")
            

            DispatchQueue.main.async {
                lowestasks.append("\(lowestask!)")
                pricehistories.append("\(pricehistory)")
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
