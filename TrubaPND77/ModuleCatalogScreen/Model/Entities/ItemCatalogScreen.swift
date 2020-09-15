//
//  ItemCatalogScreen.swift
//  TrubaPND77
//
//  Created by Serg on 10.09.2020.
//  Copyright © 2020 Sergey Gladkiy. All rights reserved.
//

import Foundation

struct ItemCatalogScreen: Decodable {
    let groupTitle: String
    let typesGroup: [TypeItemGroup]
}