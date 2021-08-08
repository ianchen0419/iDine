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
                Section {
                    ForEach(favorite.items) {item in
                        NavigationLink(destination: ItemDetail(item: item)) {
                            Text(item.name)
                        }
                    }.onDelete(perform: deleteItems)
                }
            }
            .navigationBarTitle("Favorite Menu")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        favorite.items.remove(atOffsets: offsets)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static let favorite = Favorite()
    
    static var previews: some View {
        FavoriteView().environmentObject(favorite)
    }
}
