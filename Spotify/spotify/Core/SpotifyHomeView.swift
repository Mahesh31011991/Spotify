//
//  SpotifyHomeView.swift
//  Spotify
//
//  Created by Mahesh Behere on 12/09/25.
//

import SwiftfulUI
import SwiftUI

struct SpotifyHomeView: View {
    
    @State private var currentUser:User? = nil
    @State private var selectedCategory:Category? = nil
    @State private var products:[Product] = []
    @State private var productRows:[ProductRow] = []
    
    var body: some View {
        
        ZStack{
            
            Color.spotifyBlack
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(
                    alignment: .center,
                    spacing: 8,
                    pinnedViews: [.sectionHeaders]
                ) {
                    
                    Section {
                        
                        VStack{
                            recentSections
                            
                            if let product = products.first{
                                spotifyNewReleaseCell(product: product)
                                    .padding(.horizontal,16)
                                    
                            }
                            
                            listRows
                               
                        }
                       
                        
                    } header: {
                        headerView
                    }

                }
                
            }
            .clipped()
            
        }
        .task{
            await getUsers()
            await getProducts()
        }
        .toolbarVisibility(.hidden, for:.navigationBar)
    }
    
    
    
    /// List Rows
    private var listRows: some View{
        ForEach(productRows,id:\.id){ productRow in
            VStack(spacing:8){
                Text(productRow.title)
                    .font(.title)
                    .foregroundStyle(Color.spotifyWhite)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.horizontal,16)
                ScrollView(.horizontal){
                    HStack(alignment:.top,spacing:8){
                        ForEach(productRow.products){ product in
                            ImageTitleRowCell(imageSize: 130, title: product.title, image: product.firstImage)
                                .asButton(.press) {
                                    
                                }
                                
                        }
                    }
                    .scrollIndicators(.hidden)
                    .padding(.horizontal,16)
                    
                }
            }
        }
    }
    
    func getProducts() async{
        do{
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
            var rows:[ProductRow] = []
            let allBrands = Set(products.map { $0.brand })
            
            for brand in allBrands{
//                let products1 = products.filter{ $0.brand  ==  brand }
                if let brand{
                    rows.append(ProductRow(title: brand, products: products))
                }
            }
            productRows = rows
            
        }catch let error{
            print("Error",error)
        }
    }
    
    func getUsers() async{
        do{
            currentUser = try await DatabaseHelper().getUsers().first
            
        }catch let error{
            print("Error",error)
        }
    }
    
    
    
    private var recentSections: some View{
        NonLazyVGrid(columns:2,alignment:.center,items: products) { product in
            if let product{
                SpotifyRecentView(randomImage: product.firstImage)
            }
        }
    }
    
    
    private func spotifyNewReleaseCell(product:Product) -> some View{
        SpotifyNewReleaseCell(
            imageName: product.firstImage,
            headline: product.brand,
            subHeadline: nil,
            title: product.title,
            subTitle: product.description) {
                
            } onPlayPressed: {
                
            }
    }
    
    
    private var headerView:some View{
        HStack{
            ZStack{
                if let currentUser{
                    ImageLoaderView(urlString: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            
                        }
                    
                }
            }
            .frame(width: 40,height: 40)
    
            ScrollView(.horizontal) {
                
                HStack{
                    ForEach(Category.allCases,id:\.self){ category in
                        SpotifyCategoryRow(title: category.rawValue.capitalized,
                                           isSelected: category == selectedCategory)
                        .onTapGesture {
                            selectedCategory = category
                        }
                        
                    }
                }
                .padding(.horizontal,16)
            }
            .scrollIndicators(.hidden)
            
        }
        .padding(.vertical,26)
        .padding(.leading,8)
        .background(Color.spotifyBlack)
        
        
    }
    
}

#Preview {
    SpotifyHomeView()
}


