//
//  ImageTitleRowCell.swift
//  Spotify
//
//  Created by Mahesh Behere on 13/09/25.
//

import SwiftUI

struct ImageTitleRowCell: View {
    var imageSize:CGFloat = 100
    var title:String = "Some Title"
    var image = Constant.randomImage
    
    var body: some View {
        
        VStack(alignment: .center,spacing: 16){
            ImageLoaderView(urlString: image)
                .frame(width: imageSize,height: imageSize)
                .background(Color.spotifyWhite)
            Text(title)
                .font(.callout)
                .lineLimit(2)
                .foregroundStyle(Color.spotifyWhite)
                .padding(4)
            
        }
        .frame(width: imageSize)
    }
}

#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        ImageTitleRowCell()
            .padding()
    }
}
