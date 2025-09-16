//
//  InterestPillGridView.swift
//  Spotify
//
//  Created by Mahesh Behere on 14/09/25.
//

import SwiftUI
import SwiftfulUI

struct UserInterest:Identifiable{
    var id = UUID().uuidString
    var icon:String?
    var emoji:String?
    var title:String?
}

struct InterestPillGridView: View {
    var userInterests: [UserInterest] = User.mock.basics + User.mock.interest
    
    var body: some View {
       
        ZStack{
            NonLazyVGrid(
                columns: 2,
                alignment: .leading,
                spacing: 2,
                items: userInterests) { interest in
                    if let interest{
                        InterestPillView(iconName: interest.icon, emoji: interest.emoji, title: interest.title ?? "")
                    }else{
                        EmptyView()
                    }
                }
        }
    }
}

#Preview {
    InterestPillGridView()
}
