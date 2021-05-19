//
//  databasetest.swift
//  seeker-sneaker
//
//  Created by Wilson Chung on 4/3/21.
//

import SwiftUI
import Firebase


struct databasetest: View {
    @State var brand = ""
    @State var name = ""
    @State var imageUrl = ""
    
    @State var brands: [String] = []
    @State var names: [String] = []
    @State var imageUrls: [String] = []
    
    var body: some View {
        VStack{
            HStack {
                TextField("Enter your Name", text: $name)
                Button(action: {upload() }) {
                    Text("Upload")
                }
                }.onAppear(perform: {
                    download()
                })
            
            List(0..<names.count, id: \.self) { i in
                Text(names[i])
            }
            List(0..<brands.count, id: \.self) { i in
                Text(brands[i])
            }
            List(0..<imageUrls.count, id: \.self) { i in
                Text(imageUrls[i])
            }
        }

    }
    func upload() {
        let db = Firestore.firestore()
        db.collection("sneak").document().setData(["name":name])
    }
    func download() {
        let db = Firestore.firestore()
        db.collection("sneakers").addSnapshotListener {(snap, err) in
            if err != nil {
                print("There is an error downloading content from the database.")
                return
            }
            
            for i in snap!.documentChanges {
                let documentId = i.document.documentID
                let brand = i.document.get("brand")
                let name = i.document.get("name")
                let imageUrl = i.document.get("imageUrl")
                
            
                DispatchQueue.main.async {
                    brands.append("\(brand!)")
                    names.append("\(name!)")
                    imageUrls.append("\(imageUrl!)")
            
                }
            }
            
        }
    }
}

struct databasetest_Previews: PreviewProvider {
    static var previews: some View {
        databasetest()
    }
}
