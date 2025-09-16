//
//  SongRowCell.swift
//  Spotify
//
//  Created by Mahesh Behere on 14/09/25.
//

import SwiftUI

struct SongRowCell: View {
    var imageSize:CGFloat = 100
    var imageName : String = Constant.randomImage
    var title:String = "Some random title"
    var subTitle:String = "Some random subtitle"
    var onCellRowClicked: (() -> Void)? = nil
    var onEllipsisClicked : (() -> Void)? = nil
    var body: some View {
        
        HStack(spacing: 8) {
            ImageLoaderView(urlString: imageName)
                .frame(width:imageSize,height: imageSize)
                .background(Color.spotifyWhite)
            HStack{
                VStack(alignment: .leading,spacing: 10) {
                    Text(title)
                        .font(.headline)
                        .foregroundStyle(Color.spotifyWhite)
                    Text(subTitle)
                        .font(.callout)
                        .foregroundStyle(Color.spotifyLightGray)
                    
                }
                .lineLimit(2)
                .frame(maxWidth: .infinity,alignment: .leading)
                Image(systemName: "ellipsis")
                    .foregroundStyle(Color.spotifyWhite)
                    .onTapGesture {
                        onEllipsisClicked?()
                    }
            }
            
            
        }
        .onTapGesture {
            onCellRowClicked?()
        }
    }
}

#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        VStack{
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
        }
        

    }
}
