//
//  TypeItemGroup.swift
//  TrubaPND77
//
//  Created by Serg on 10.09.2020.
//  Copyright © 2020 Sergey Gladkiy. All rights reserved.
//

import Foundation

struct TypeItemGroup: Decodable {
    let indexType: Int
    let titleType: String
    let attachments: [AttachmentItemCatalogScreen]
}
