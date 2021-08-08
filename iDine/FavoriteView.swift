//
//  FavoriteView.swift
//  iDine
//
//  Created by Yi An Chen on 2021/8/8.
//  Copyright © 2021 cheyian. All rights reserved.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var favorite: Favorite
    
    var body: some View {
        NavigationView {
            List {
                ForEach(favorite.items) {item in
                    Text(item.name)
                }
            }.navigationBarTitle("Favorite Menu")
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static let favorite = Favorite()
    
    static var previews: some View {
        FavoriteView().environmentObject(favorite)
    }
}
