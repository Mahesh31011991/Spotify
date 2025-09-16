//
//  BumbleCardView.swift
//  Spotify
//
//  Created by Mahesh Behere on 14/09/25.
//

import SwiftUI
import SwiftfulUI

struct BumbleCardView: View {
    let user:User = .mock
    @State private var cardFrame:CGRect = .zero
    
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 8) {
                

                // Header View
                headerView
                    .frame(height: cardFrame.height)
                
              
                
                
                
            }
        }
        .background(.bumbleBackgroundYellow)
        .cornerRadius(32)
        .readingFrame { frame in
            cardFrame = frame
        }
            
    }
    
    
   
   
    
    private var headerView: some View{
        ZStack(alignment: .bottomLeading){
            ImageLoaderView(urlString: Constant.randomImage)
            
            VStack(alignment: .leading,spacing: 8){
                Text("\(user.firstName) + \(user.age)")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                
                HStack(spacing: 4){
                    Image(systemName: "suitcase")
                    Text(user.work)
                }
                HStack(spacing: 4){
                    Image(systemName: "graduationcap")
                    Text(user.education)
                }
                
                BumbleHeartView()
                    .onTapGesture {
                        
                    }
                
            }
            .padding(24)
            .font(.callout)
            .fontWeight(.medium)
            .foregroundStyle(.bumbleWhite)
            .frame(maxWidth: .infinity,alignment: .leading)
            .background(
                LinearGradient(
                    colors: [
                        .bumbleBlack.opacity(0),
                        .bumbleBlack.opacity(0.6),
                        .bumbleBlack.opacity(0.6),
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
    }
}

#Preview {
    BumbleCardView()
        .padding(.vertical,40)
        .padding(.horizontal,16)
        .cornerRadius(16)
}
