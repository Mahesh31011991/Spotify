//
//  SpotifyRecentView.swift
//  Spotify
//
//  Created by Mahesh Behere on 13/09/25.
//

import SwiftUI
import SwiftfulUI
struct SpotifyRecentView: View {
    
    var randomImage = Constant.randomImage
    var title:String = "Random Title Caption"
    var body: some View {
        HStack{
            ImageLoaderView(urlString: randomImage)
                .frame(width: 70, height: 70)
            
            Text(title)
                .font(.headline)
                .lineLimit(2)
            
        }
        .padding(.trailing,8)
        .themeColor(isSelected: false)
        .cornerRadius(6)
    }
}

#Preview {
    ZStack{
        Color.spotifyBlack
            .edgesIgnoringSafeArea(.all)
        VStack{
            HStack{
                SpotifyRecentView()
                SpotifyRecentView()
            }
            HStack{
                SpotifyRecentView()
                SpotifyRecentView()
            }
        }
    }
}
