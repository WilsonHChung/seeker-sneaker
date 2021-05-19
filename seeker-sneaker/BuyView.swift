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
    @State var lowestasks: [String] = []
    
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
                        Button(action: {
                            // Update db with new transaction,
                            // go to confirmation page
                        }) {
                            List(0..<lowestasks.count, id: \.self) { i in
//                                Text(String(format: "Buy Now for $%i", price))
                                Text("Buy Now for $\(lowestasks[0])")
                                    .font(.title)
                                    .accentColor(.green)
                                    .padding(.horizontal, 55)
                                    .padding(.vertical, 25)
                            }
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
                               in: 0...(Double(price) + 400),
                               step: 5,
                               onEditingChanged: {
                                editing in
                                isEditing = editing
                               })
                            .accentColor(.green)
                            .padding(.horizontal, 30)
                        
//                        Text(String(format: "Highest Offer: $%i", highest_offer))
//                            .padding(.top, 20)

                        Text(String(format: "Your Offer: $%.0f", offer))
//                            .padding(.bottom, 5)
//
//                        Text(String(format: "Lowest Ask: $%i", price))
////                            .padding(.bottom, 20)
                        
                        List(0..<lowestasks.count, id: \.self) { i in
                            Text("Lowest Ask: $\(lowestasks[0])")
                                .padding(.vertical, -20)
                                .padding(.horizontal, 103)
                        }
                        
                        Button(action: {
                            // Update db with new offer,
                            // go to confirmation page
                        }) {
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
//            db.collection("transactions").document().setData(["name":name])
//            db.collection("transactions").document().setData(["type":type])
//            db.collection("transactions").document().setData(["size":size])
//            db.collection("transactions").document().setData(["price":price])

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

            DispatchQueue.main.async {
                lowestasks.append("\(lowestask!)")
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
