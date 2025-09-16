//
//  ContentView.swift
//  Spotify
//
//  Created by Mahesh Behere on 12/09/25.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    
    @State private var users:[User] = []
    @State private var products:[Product] = []
    
    var body: some View {
        ScrollView{
            VStack(spacing: 13.0){
                ForEach(products,id:\.id)  { user in
                    Text(user.title)
                }
            }
        }
        .task{
            await getUsers()
        }
    }
    
    func getUsers() async{
        do{
            products = try await DatabaseHelper().getProducts()
        }catch{
            
        }
    }
}

#Preview {
    ContentView()
}
