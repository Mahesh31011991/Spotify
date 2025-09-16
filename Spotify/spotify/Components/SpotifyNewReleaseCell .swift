//
//  SpotifyNewReleaseCell .swift
//  Spotify
//
//  Created by Mahesh Behere on 13/09/25.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    var imageName : String = Constant.randomImage
    var headline : String? = "Headline"
    var subHeadline: String? = "Sub Headline"
    var title : String? = "Title"
    var subTitle: String? = "Sub Title"
    var onAddtoPlayList: (()->Void)? = nil
    var onPlayPressed:(()-> Void)? = nil
    
    var body: some View {
        VStack(){
            
            HStack{
                ImageLoaderView(urlString: imageName)
                    .frame(width:50,height:50)
                    .clipShape(Circle())
                VStack(alignment:.leading){
                    if let headline{
                        Text(headline)
                            .foregroundStyle(.spotifyLightGray)
                            .font(.callout)
                    }
                    if let title{
                        Text(title)
                            .foregroundStyle(.spotifyWhite)
                            .font(.title2)
                            .fontWeight(.medium)
                    }
                    
                }
            }
            .frame(maxWidth: .infinity,alignment: .leading)
           
            
            HStack{
                ImageLoaderView(urlString: imageName)
                    .frame(width: 140,height: 140)
                    .cornerRadius(8)
                
                VStack(alignment:.leading,spacing: 32){
                    VStack(alignment: .leading,spacing:10){
                        
                        if let title{
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.spotifyWhite)
                            
                        }
                        if let subTitle{
                            Text(subTitle)
                                .foregroundStyle(.spotifyLightGray)
                                .lineLimit(2)
                        }
                    }
                    .font(.callout)
                    
                    HStack{
                        Image(systemName: "plus.circle")
                            .font(.title3)
                            .foregroundStyle(.spotifyWhite)
                            
                            .padding(4)
                            .background(Color.black.opacity(0.0001))
                            .onTapGesture {
                                onAddtoPlayList?()
                            }
                            .offset(x:-4)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            
                        Image(systemName: "play.circle.fill")
                            .font(.title)
                            .foregroundStyle(.spotifyWhite)
                    }
                    .padding(.bottom,8)
                    
                }
                .padding(.trailing,16)
            }
            .themeColor(isSelected: false)
            .cornerRadius(8)
            
        }
        .onTapGesture {
            onPlayPressed?()
        }
       
        
       
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        SpotifyNewReleaseCell()
            .padding()
    }
}
