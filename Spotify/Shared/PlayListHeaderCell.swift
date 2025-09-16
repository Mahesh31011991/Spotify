//
//  PlayListHeaderCell.swift
//  Spotify
//
//  Created by Mahesh Behere on 14/09/25.
//

import SwiftUI
import SwiftfulUI

struct PlayListHeaderCell: View {
    
    var title:String = ""
    var subTitle = ""
    var imageName = Constant.randomImage
    var shadowColor = Color.spotifyBlack.opacity(0.8)
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay(
                ImageLoaderView(urlString: imageName)
            )
            .overlay (
                VStack(alignment: .leading,spacing:4){
                    Text("Huwai")
                        .font(.headline)
                    Text("Huwai 360")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                }
                    .padding(16)
                .foregroundStyle(Color.spotifyWhite)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .background(
                        LinearGradient(colors: [shadowColor.opacity(0),shadowColor], startPoint: .top, endPoint: .bottom)
                    ),
                alignment:.bottomLeading
            )
            .asStretchyHeader(startingHeight: 300)
        }
        
    
}

#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        ScrollView{
            PlayListHeaderCell()
        }
    }
}
