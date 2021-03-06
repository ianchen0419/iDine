//
//  AppView.swift
//  iDine
//
//  Created by Yi An Chen on 2021/8/7.
//  Copyright © 2021 cheyian. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
                }
            
            FavoriteView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorite")
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = Order()
    static let favorite = Favorite()
    static var previews: some View {
        AppView()
            .environmentObject(order)
            .environmentObject(favorite)
    }
}
