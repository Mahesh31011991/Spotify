//
//  BumbleHomeView.swift
//  Spotify
//
//  Created by Mahesh Behere on 14/09/25.
//

import SwiftUI

struct BumbleHomeView: View {
    var user:User = User.mock
    
    @State var filters:[String] = ["Everyone","Trending","Latest"]
    @AppStorage("bumble_home_filter") var selectedFilter:String = "Everyone"
    
    var body: some View {
        ZStack{
            Color.bumbleBackgroundYellow.ignoresSafeArea()
            
            VStack(spacing: 8) {
                // Header
              //  header
                // Filter
                BumbleFilterView(options: filters, selection: $selectedFilter)
                    .background(
                        Divider(),alignment: .bottom
                    )
                
                aboutMeSection
                    .padding(.vertical,24)
                    .padding(.horizontal,24)
                
                myInterestSection
                    .padding(.vertical,24)
                    .padding(.horizontal,24)
                
                Spacer()
            }
            
            
        }
    }
    
    private var aboutMeSection:some View{
        VStack(alignment: .leading,spacing: 12){
            sectionTitle(title: "About me")
            
            Text("This is the info about me where you can read it on web portal")
                .font(.body)
            
            HStack{
                BumbleHeartView()
                Text("Send a Compliment")
                    .font(.callout)
                    .fontWeight(.semibold)
            }
            .padding([.horizontal,.trailing],8)
            .background(
                Color.bumbleYellow
            )
            .cornerRadius(32)
            
        }
        .frame(maxWidth: .infinity,alignment: .leading)
    }
    
    private var myInterestSection:some View{
        VStack(alignment: .leading,spacing: 12) {
            VStack(alignment: .leading,spacing: 8) {
                sectionTitle(title: "My Basics")
                InterestPillGridView(userInterests: user.basics)
                
            }
            VStack(alignment: .leading,spacing: 8) {
                sectionTitle(title: "My Interest")
                InterestPillGridView(userInterests: user.interest)
                
            }
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        
    }
    
    private func sectionTitle(title:String)-> some View{
        Text(title)
            .font(.body)
            .foregroundStyle(.bumbleGray)
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
