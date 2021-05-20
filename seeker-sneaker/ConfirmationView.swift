//
//  ConfirmationView.swift
//  seeker-sneaker
//
//  Created by Dominic Gutierrez on 4/28/21.
//
import SwiftUI
import Firebase

struct ConfirmationView: View {
    var type: String = "Purchase"
    var size: Double = 7.5
    var product: Feed = feedData[0]
    var amount: String = ""
    

    @State var data: [Double] = []

    
    @State var pricehistory = ""
    @State var pricehistories: [String] = []
    
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
                }.onAppear(perform: {
                    if (type == "Ask") {
                        upload_ask()
                    }
                    else if(type == "Offer") {
                        upload_offer()
                    }
                    else if(type == "Sale" || type == "Purchase") {
                        download()
                        upload_latestprice()
                    }
                })
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .padding(.horizontal, 20)
                Text("$" + amount)
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
        }.onDisappear(perform: {
            if(type == "Sale" || type == "Purchase") {
                upload_purchasehistory()
            }
        })
    }
    func upload_latestprice() {
        let db = Firestore.firestore()
        db.collection("transactions").document("air jordan 1 fragment").setData(["latestprice": amount], merge: true)
    }
    func upload_purchasehistory() {
        let db = Firestore.firestore()
        db.collection("transactions").document("air jordan 1 fragment").setData(["pricehistory": data], merge: true)
    }
    func upload_ask() {
        let db = Firestore.firestore()
        db.collection("transactions").document("air jordan 1 fragment").setData(["lowestask": amount], merge: true)
    }
    func upload_offer() {
        let db = Firestore.firestore()
        db.collection("transactions").document("air jordan 1 fragment").setData(["highestbid": amount], merge: true)
    }
    func download() {

        
        let db = Firestore.firestore()
        db.collection("transactions").addSnapshotListener {(snap, err) in


        if err != nil {
            print("There is an error downloading content from the database.")
            return
        }
            
        var storage: [Double] = []

        for i in snap!.documentChanges {
            let documentId = i.document.documentID
            let pricehistory = i.document.get("pricehistory")
                        
            let prices = ("\(pricehistory!)")
            let stringArray = prices.components(separatedBy: CharacterSet.decimalDigits.inverted)
            for item in stringArray {
                if let history = Int(item) {
                    print("number: \(history)")
                    storage.append(Double(history))
                }
            }


            DispatchQueue.main.async {
                pricehistories.append("\(pricehistory)")
            }


        }
        data = storage
        if(type == "Sale" || type == "Purchase") {
            data.append(Double(amount)!)
        }
        print(data)

    }
}
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView()
    }
}
