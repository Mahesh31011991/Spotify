//
//  InterestPillView.swift
//  Spotify
//
//  Created by Mahesh Behere on 14/09/25.
//

import SwiftUI

struct InterestPillView: View {
    
    var iconName:String? = "heart.fill"
    var emoji:String? = "💕"
    var title:String = "Graduate Degree"
    
    var body: some View {
        
        HStack{
            if let iconName{
                Image(systemName: iconName)
            }else if let emoji{
                Image(systemName: emoji)
            }
            
            Text(title)
        }
        .font(.callout)
        .fontWeight(.medium)
        .padding(.vertical,6)
        .padding(.horizontal,12)
        .foregroundStyle(.bumbleBlack)
        .background(.bumbleLightYellow)
        .cornerRadius(32)
    }
}

#Preview {
    InterestPillView()
}
