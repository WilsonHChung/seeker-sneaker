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
                    if !asking {
                        NavigationLink(
                        destination:
                        ConfirmationView(type: "Sale", size: size, product: product, amount: store_value)){
                            List(0..<highestbids.count, id: \.self) { i in
                                Text("Sell Now for $\(highestbids[0])")
                                    .font(.title)
                                    .accentColor(.green)
                                    .padding(.horizontal, 60)
                                    .padding(.vertical, 25)
                            }
                            
            
                        }.onDisappear(perform: {
                            upload()
                        })
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
                        
                            
                        Text(String(format: "Your Ask: $%.0f", ask))
                            .padding(.bottom, 5)
                        
                        List(0..<highestbids.count, id: \.self) { i in
                            Text("Highest Bid: $\(highestbids[0])")
                                .padding(.vertical, -20)
                                .padding(.horizontal, 102)
                        }
                        
                        NavigationLink(
                            destination:
                            ConfirmationView(type: "Ask", size: size, product: product, amount: String(ask))){
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
    

    func upload() {
        let db = Firestore.firestore()
        db.collection("test").document("air jordan 1 fragment").setData(["latestprice":store_value])

        //        db.collection("transactions").document().setData(["lowestask":ask])
//        db.collection("transactions")
//            .document("air")
//            .set("lowestask":ask, { merge: true });
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

