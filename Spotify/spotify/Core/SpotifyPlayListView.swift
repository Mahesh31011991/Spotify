//
//  SpotifyPlayListView.swift
//  Spotify
//
//  Created by Mahesh Behere on 14/09/25.
//

import SwiftUI

struct SpotifyPlayListView: View {
    var product:Product = Product.mock
    var user:User = .mock
    @State private var products:[Product] = []
    
    var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack(spacing: 8) {
                    
                    PlayListHeaderCell(title: product.title, subTitle: product.description, imageName: product.thumbnail, shadowColor: .spotifyBlack)
                    
                    PlayListDescriptionCell(
                        descriptionText: product.description,
                        username: user.username,
                        headline: "Apple",
                        onAddtoPlaylistPressed: nil,
                        onDownloadPressed: nil,
                        onsharePressed: nil,
                        onEllipsisPressed: nil,
                        onshufflePressed: nil,
                        onPlayPressed: nil
                    )
                    .padding(.horizontal,16)
                    
                    ForEach(products,id:\.id){ product in
                        SongRowCell(
                            imageSize: 50,
                            imageName: product.firstImage,
                            title: product.title,
                            subTitle: product.description
                        )
                        .padding(.horizontal,16)
                    }
                    
                }
            }.scrollIndicators(.hidden)
        }
        .task {
            do{
                try await getProducts()
            }catch{
                
            }
        }
    }
    
    private func getProducts() async throws{
        self.products = try await DatabaseHelper().getProducts()
    }
}

#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
    SpotifyPlayListView()
 }
}
