//
//  BumbleHomeView.swift
//  Spotify
//
//  Created by Mahesh Behere on 14/09/25.
//

import SwiftUI

struct BumbleHomeView: View {
    var user:User = User.mock
    @State private var cardFrame:CGRect = .zero
    
    @State var filters:[String] = ["Everyone","Trending","Latest"]
    @AppStorage("bumble_home_filter") var selectedFilter:String = "Everyone"
    
    var body: some View {
        ZStack{
            Color.bumbleBackgroundYellow.ignoresSafeArea()
            
                VStack(spacing: 8) {
                    //MARK: // Header
                    header
                    //MARK: // Filter
                    BumbleFilterView(options: filters, selection: $selectedFilter)
                        .background(
                            Divider(),alignment: .bottom
                        )
                    BumbleCardView()
                }
            }
            
            
        }
    
    private var header:some View{
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "line.horizontal.3")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                Image(systemName: "arrow.uturn.left")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Bumble")
                .font(.title)
                .foregroundStyle(Color.bumbleYellow)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Image(systemName: "slider.horizontal.3")
                .padding(8)
                .background(Color.black.opacity(0.001))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .onTapGesture {
                    
                }
            
        }
        .font(.title2)
        .fontWeight(.medium)
        .foregroundStyle(Color.bumbleBlack)
    }
    }
    
    
   


#Preview {
    
    BumbleHomeView()
}
