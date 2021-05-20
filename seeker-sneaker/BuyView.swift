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
                            List(0..<lowestasks.count, id: \.self) { i in
                                Text("Buy Now for $\(lowestasks[0])")
                                    .font(.title)
                                    .accentColor(.green)
                                    .padding(.horizontal, 55)
                                    .padding(.vertical, 25)
                                }
                            
                        }.onDisappear(perform: {
//                            upload_latestprice()
                        })
                            
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
                               in: 0...(Double(price) + 400),
                               step: 5,
                               onEditingChanged: {
                                editing in
                                isEditing = editing
                               })
                            .accentColor(.green)
                            .padding(.horizontal, 30)
                    

                        Text(String(format: "Your Offer: $%.0f", offer))
                        
                        List(0..<lowestasks.count, id: \.self) { i in
                            Text("Lowest Ask: $\(lowestasks[0])")
                                .padding(.vertical, -20)
                                .padding(.horizontal, 103)
                        }
                        
                        NavigationLink(
                            destination:
                                ConfirmationView(type: "Offer", size: size, product: product, amount: String(Int(offer)))){
                                    Text("Submit")
                                        .font(.title)
                                        .padding(.vertical, 5)
                                        .accentColor(.green)
                                }.onDisappear(perform: {
//                                    upload_bid()
                                })
                    }
                    
                }
                
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
            
//            var prices = ("\(pricehistory!)")
//            prices.append("50000")
//
//            print(prices)
//
//            let stringArray = prices.components(separatedBy: CharacterSet.decimalDigits.inverted)
//            
//            print(prices)
//            print(stringArray)
            
//            for item in stringArray {
//                if let history = Int(item) {
//                    print("number: \(history)")
//                    storage.append(Double(history))
//                }
//            }


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
