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
                
                //MARK: // About Me Section
                aboutMeSection
                    .padding(.vertical,24)
                    .padding(.horizontal,24)
                
                
                
                // MARK: // My Interest Section
                myInterestSection
                    .padding(.vertical,24)
                    .padding(.horizontal,24)
                
                ForEach(user.images,id:\.self){ image in
                    VStack{
                        ImageLoaderView(urlString: image)
                            .frame(height: cardFrame.height)
                    }
                }
                
                
                // MARK: // Location Section
                locationSection
                    .padding(.vertical,24)
                    .padding(.horizontal,24)
                
                // MARK: // Footer Section
                footerSection
                    .padding(.top,60)
                    .padding(.horizontal,60)
                    .padding(.bottom,60)
                
                
                
                
                
                Spacer()
            }
        }
        .readingFrame { frame in
            cardFrame = frame
        }
        .overlay(alignment: .bottomTrailing) {
            overlayHexagonButton
                .padding(24)
        }
        
    }
    
    
    
    
    
    
    
    private var overlayHexagonButton: some View{
        Image(systemName: "hexagon.fill")
            .foregroundStyle(.bumbleYellow)
            .font(.system(size: 60,weight: .medium))
            .overlay {
                Image(systemName: "star.fill")
                    .font(.system(size: 30))
                    .fontWeight(.medium)
            }
            .onTapGesture {
                
            }
    }
    
    private var footerSection: some View{
        VStack(spacing: 8) {
            HStack(spacing: 10) {
                Circle()
                    .fill(.bumbleYellow)
                    .overlay {
                        Image(systemName: "xmark")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .frame(width: 60,height: 60)
                Spacer(minLength: 0)
                Circle()
                    .fill(.bumbleYellow)
                    .overlay {
                        Image(systemName: "checkmark")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .frame(width: 60,height: 60)
            }
            
            Text("Hide and Report")
                .font(.headline)
                .foregroundStyle(.bumbleGray)
                .padding(8)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                    
                }
        }
    }
    
    private var locationSection: some View{
        VStack(alignment: .leading, spacing:8) {
            HStack(spacing:8){
                Image(systemName: "mappin.and.ellipse.circle.fill")
                Text("\(user.firstName) 's Location")
            }
            .foregroundStyle(.bumbleGray)
            .font(.body)
            .fontWeight(.medium)
            Text("10 miles away")
                .foregroundStyle(.bumbleBlack)
                .font(.headline)
            
            InterestPillView(iconName: "🇺🇸", emoji: "🇺🇸", title: "Lives in New York, NY")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
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
