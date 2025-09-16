//
//  PlayListDescriptionCell.swift
//  Spotify
//
//  Created by Mahesh Behere on 14/09/25.
//

import SwiftUI

struct PlayListDescriptionCell: View {
    var descriptionText = Product.mock.description
    var username:String = "Mahesh"
    var headline:String = "some Headline goes here"
    var onAddtoPlaylistPressed:(()-> Void)? = nil
    var onDownloadPressed: (()-> Void)? = nil
    var onsharePressed: (() -> Void)? = nil
    var onEllipsisPressed: (()->Void)? = nil
    var onshufflePressed: (()-> Void)? = nil
    var onPlayPressed: (()-> Void)? = nil
    
    var body: some View {
        VStack(alignment:.leading,spacing:8){
            
            Text(descriptionText)
                .foregroundStyle(.spotifyWhite)
            
            madeForYouSection
            
            Text(headline)
                .foregroundStyle(.spotifyWhite)
            
            buttonRows
                .offset(x:-8)
        }
        .foregroundStyle(.spotifyLightGray)
    }
    
    private var madeForYouSection:some View{
        HStack(spacing: 8){
            Image(systemName: "applelogo")
                .foregroundStyle(.spotifyGreen)
            Text("Made for ")
                .foregroundStyle(.spotifyLightGray)
            +
            Text(username)
                .bold()
                .foregroundStyle(.spotifyWhite)
        }
    }
    
    
    private var buttonRows:some View{
        HStack{
            HStack{
                Image(systemName: "plus.circle")
                    .padding(8)
                    .background(Color.spotifyBlack.opacity(0))
                    .onTapGesture {
                        
                    }
                Image(systemName: "arrow.down.circle")
                    .padding(8)
                    .background(Color.spotifyBlack.opacity(0))
                    .onTapGesture {
                        
                    }
                Image(systemName: "square.and.arrow.up")
                    .padding(8)
                    .background(Color.spotifyBlack.opacity(0))
                    .onTapGesture {
                        
                    }
                Image(systemName: "ellipsis")
                    .padding(8)
                    .background(Color.spotifyBlack.opacity(0))
                    .onTapGesture {
                        
                    }
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            
            HStack{
                Image(systemName: "shuffle")
                    .font(.system(size: 24))
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 46))
                    .onTapGesture {
                        
                    }
                
            }
            .foregroundStyle(.spotifyGreen)
        }
    }
    
}

#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        PlayListDescriptionCell()
            .padding()
    }
    
}
