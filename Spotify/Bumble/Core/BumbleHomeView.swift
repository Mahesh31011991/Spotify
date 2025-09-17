//
//  BumbleHomeView.swift
//  Spotify
//
//  Created by Mahesh Behere on 14/09/25.
//

import SwiftUI
import SwiftfulUI

struct BumbleHomeView: View {
    var user:User = User.mock
    @State private var cardFrame:CGRect = .zero
    @State private var selectedIndex:Int = 0
    @State private var users:[User] = []
    @State private var cardOffsets:[Int:Bool] = [:]
    
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
                
                ZStack{
                    if !users.isEmpty {
                        ForEach(Array(users.enumerated()),id:\.offset){(index,user) in
                            
                            let currentIndex =  selectedIndex == index
                            let previousIndex = (selectedIndex - 1) == index
                            let nextIndex = (selectedIndex + 1) == index
                            if currentIndex || previousIndex || nextIndex{
                                let offsetValue = cardOffsets[user.id]
                                
                                Rectangle()
                                    .fill(.black.opacity(0.0))
                                    .overlay (
                                        ImageLoaderView(urlString: user.image)
                                            .frame(maxWidth: .infinity)
                                     )
                                    .zIndex(Double(users.count - index))
                                    .offset(x:offsetValue == nil ? 0 : offsetValue == true ? 900 : -900)
                                    .withDragGesture(
                                        .horizontal,
                                        resets: true,
                                        rotationMultiplier: 1.05,
                                        scaleMultiplier: 0.7
                                    ){ dragOffset in
                                        
                                    } onEnded: { dragOffset in
                                        if dragOffset.width <= -50{
                                            userDidSelect(index: index, isLike: false)
                                        }else if dragOffset.width >= 50{
                                            userDidSelect(index: index, isLike: true)
                                        }
                                    }
                                
                            }
                        }
                    }else{
                        ProgressView("Loading....")
                    }
                    
                }
                .frame(maxHeight:.infinity)
            }
           
            
            //                    BumbleCardView()
        }
        .task {
            await getUsers()
        }
        .toolbar(.hidden, for: .navigationBar)
//        .animation(.smooth, value: )
        
       
    
    
}

    private func userDidSelect(index:Int,isLike:Bool){
        let user = users[index]
        cardOffsets[index] = isLike
        
        selectedIndex += 1
    }

private  func getUsers() async{
    do{
        users = try await DatabaseHelper().getUsers()
        print(users)
        
    }catch let error{
        print("Error",error)
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
