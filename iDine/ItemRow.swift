//
//  ItemRow.swift
//  iDine
//
//  Created by Yi An Chen on 2021/8/5.
//  Copyright © 2021 cheyian. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    var item: MenuItem
    
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
            VStack(alignment: .leading) {
                Text(item.name)
                Text("$\(item.price)")
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
