//
//  BumbleHeartView.swift
//  Spotify
//
//  Created by Mahesh Behere on 14/09/25.
//

import SwiftUI

struct BumbleHeartView: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(.bumbleYellow)
                .frame(width: 40, height:40)
            Image(systemName: "bubble.fill")
                .foregroundStyle(.bumbleBlack)
                .font(.system(size: 24))
                .offset(y:2)
            Image(systemName: "heart.fill")
                .foregroundStyle(.bumbleYellow)
                .font(.system(size: 10))
                
                
        }
    }
}

#Preview {
    BumbleHeartView()
}
