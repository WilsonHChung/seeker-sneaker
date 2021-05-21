//
//  Transactions.swift
//  seeker-sneaker
//
//  Created by Wilson Chung on 5/20/21.
//

import SwiftUI

struct Transactions: View {
    var body: some View {
        Home()
    }
}

struct Home : View {
    
    @State var menu = 0
    @State var page = 0
    
    var body: some View{
        
        ZStack{
            
            Color("Color").edgesIgnoringSafeArea(.all)
            
            VStack{
                
                ZStack{
                    
                    HStack{
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("Menu")
                                .renderingMode(.original)
                                .padding()
                        }
                        .background(Color.white)
                        .cornerRadius(10)
                        
                        Spacer()
                        
                        Image("pic")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    
                    Text("Hi Wilson!")
                        .font(.largeTitle)
                        .padding(.vertical, 20)
                        .multilineTextAlignment(.center)
                    
                }
                
                HStack(spacing: 15){
                    
                }
                .padding(.top, 30)
                
                GeometryReader{g in
                    
                    Carousel(width: UIScreen.main.bounds.width, page: self.$page, height: g.frame(in: .global).height)
                }
                
                PageControl(page: self.$page)
                .padding(.top, 20)
            }
            .padding(.vertical)
        }
    }
}

struct List : View {
    
    @Binding var page : Int
    
    var body: some View{
        
        HStack(spacing: 0){
            
            ForEach(data){i in
                
                Card(page: self.$page, width: UIScreen.main.bounds.width, data: i)
            }
        }
    }
}

struct Card : View {
    
    @Binding var page : Int
    var width : CGFloat
    var data : Type
    
    var body: some View{
        
        VStack{
            
            VStack{
                
                Text(self.data.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top,20)
                
                Text(self.data.cName)
                    .foregroundColor(.gray)
                    .padding(.vertical)
                
                Spacer(minLength: 0)
                
                Image(self.data.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text(self.data.context)
                    .fontWeight(.bold)
                    .font(.title)
                    .padding(.top, 20)
                
        
                
                
                Spacer(minLength: 0)
                
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 25)
            .background(Color.white)
            .cornerRadius(20)
            .padding(.top, 25)
            .padding(.vertical, self.page == data.id ? 0 : 25)
            .padding(.horizontal, self.page == data.id ? 0 : 25)
            
        }
        .frame(width: self.width)
        .animation(.default)
    }
}

struct Carousel : UIViewRepresentable {
    
    
    func makeCoordinator() -> Coordinator {
        
        return Carousel.Coordinator(parent1: self)
    }
    
    var width : CGFloat
    @Binding var page : Int
    var height : CGFloat
    
    func makeUIView(context: Context) -> UIScrollView{
        
        
        let total = width * CGFloat(data.count)
        let view = UIScrollView()
        view.isPagingEnabled = true
        view.contentSize = CGSize(width: total, height: 1.0)
        view.bounces = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = context.coordinator
                
        
        let view1 = UIHostingController(rootView: List(page: self.$page))
        view1.view.frame = CGRect(x: 0, y: 0, width: total, height: self.height)
        view1.view.backgroundColor = .clear
        
        view.addSubview(view1.view)
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        
    }
    
    class Coordinator : NSObject,UIScrollViewDelegate{
        
        
        var parent : Carousel
        
        init(parent1: Carousel) {
            
        
            parent = parent1
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            
            
            let page = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
            
            self.parent.page = page
        }
    }
}

struct PageControl : UIViewRepresentable {
    
    @Binding var page : Int
    
    func makeUIView(context: Context) -> UIPageControl {
        
        let view = UIPageControl()
        view.currentPageIndicatorTintColor = .black
        view.pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
        view.numberOfPages = data.count
        view.currentPage = page
        return view
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        
        
        DispatchQueue.main.async {
            
            uiView.currentPage = self.page
            
        }
    }
}

struct Type : Identifiable {
    
    var id : Int
    var name : String
    var cName : String
    var context : String
    var image : String
}

var data = [

    Type(id: 0, name: "Purchases", cName: "Air Jordan 1 Bred Toe", context: "Bought for $525", image: "bred_toe"),
    
    Type(id: 1, name: "Sales", cName: "Nike Dunk Low Green Lobster", context: "Sold for $450", image: "green_lobster"),
    
    Type(id: 2, name: "Asks", cName: "Nike Dunk Low Green Lobster", context: "Asking for $600", image: "green_lobster"),
    
    Type(id: 3, name: "Bids", cName: "", context: "No bids available", image: "bean"),
    
]


struct Transactions_Previews: PreviewProvider {
    static var previews: some View {
        Transactions()
    }
}
