//
//  ItemDetail.swift
//  iDine
//
//  Created by Yi An Chen on 2021/8/6.
//  Copyright © 2021 cheyian. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    @EnvironmentObject var favorite: Favorite
    var item: MenuItem
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
            //如果將.padding放到.background後面，會發生畫面沒有內距的狀況，因為背景先塗黑了，才繪上內距，新加入的內距會沒有上到黑色
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            Button("Order This"){
                self.order.add(item: self.item)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .font(.headline)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(12)
            .padding()
            
            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.favorite.add(item: self.item)
        }){
            Image(systemName: "heart")
        })
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    static let favorite = Favorite()
    
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example)
                .environmentObject(order)
                .environmentObject(favorite)
        }
    }
}
