//
//  ViewModelMainScreenProtocol.swift
//  TrubaPND77
//
//  Created by Serg on 29.07.2020.
//  Copyright © 2020 Sergey Gladkiy. All rights reserved.
//

import Foundation

enum ViewModelMainScreenState {
    case initial
    case readyToShowItems
    case errorOccured(String)
}

protocol ViewModelMainScreenProtocol {
    var state: Observable<ViewModelMainScreenState> { get }
    func getShowableInfo()
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CellViewModelMainScreen?
}
