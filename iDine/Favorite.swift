
//
//  Favorite.swift
//  iDine
//
//  Created by Yi An Chen on 2021/8/8.
//  Copyright © 2021 cheyian. All rights reserved.
//

import SwiftUI

class Favorite: ObservableObject {
    @Published var items = [MenuItem]()

    func add(item: MenuItem) {
        items.append(item)
    }

    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
