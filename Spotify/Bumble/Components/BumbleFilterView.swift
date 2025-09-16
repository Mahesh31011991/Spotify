//
//  BumbleFilterView.swift
//  Spotify
//
//  Created by Mahesh Behere on 14/09/25.
//

import SwiftUI

struct BumbleFilterView: View {
    var options:[String] = ["Everyone","Trending","Latest"]
    @Binding var selection:String
    @Namespace private var namespace
    
    var body: some View {
        HStack(alignment: .top,spacing: 32){
            ForEach(options,id:\.self) { option in
                VStack(spacing: 8) {
                    Text(option)
                        .font(.headline)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                    if selection == option{
                        RoundedRectangle(cornerRadius: 8)
                            .frame(height: 1.5)
                            .matchedGeometryEffect(id: "selection", in: namespace)
                    }
                    
                }
                .padding(.top,8)
                .background(Color.black.opacity(0.0001))
                .foregroundStyle(selection == option ? Color.bumbleBlack : Color.bumbleGray)
                .onTapGesture {
                    selection = option
                }
            }
        }
        .animation(.smooth, value: selection)
    }
}

fileprivate struct BumbleFilterViewPreviewView: View {
    var options:[String] = ["Everyone","Trending","Latest"]
    @State var selection:String = "Everyone"
    var body: some View {
        BumbleFilterView(options: options, selection: $selection)
    }
}

#Preview {
    BumbleFilterViewPreviewView()
}
