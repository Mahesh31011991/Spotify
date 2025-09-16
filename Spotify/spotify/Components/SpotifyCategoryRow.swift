//
//  SpotifyCategoryRow.swift
//  Spotify
//
//  Created by Mahesh Behere on 12/09/25.
//

import SwiftUI

struct SpotifyCategoryRow: View {
    
    var title:String = "Music"
    var isSelected:Bool = false
    
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 30)
            .padding(.vertical,10)
            .padding(.horizontal,14)
            .themeColor(isSelected: isSelected)
            .cornerRadius(16)
    }
}

#Preview {
    ZStack{
        Color.black
            .ignoresSafeArea()
        VStack{
            SpotifyCategoryRow()
            SpotifyCategoryRow(isSelected: true)
            SpotifyCategoryRow()
        }
    }
}


extension View{
    
    func themeColor(isSelected:Bool) -> some View{
        self
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
    }
}
