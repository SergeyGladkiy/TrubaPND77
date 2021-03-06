//
//  ModelAssignmentScreen.swift
//  TrubaPND77
//
//  Created by Serg on 19.08.2020.
//  Copyright © 2020 Sergey Gladkiy. All rights reserved.
//

import Foundation

class ModelAssignmentScreen {
    var dataSource = Observable<[ItemAssignmentScreen]>(observable: [ItemAssignmentScreen]())
    var errorOccured = Observable<CustomError>(observable: .initial)
    
    private let networking: NetworkProtocolAssignmentModule
    private let mapper: MapperModelProtocolAssignmentScreen
    
    init(networking: NetworkProtocolAssignmentModule, mapper: MapperModelProtocolAssignmentScreen) {
        self.networking = networking
        self.mapper = mapper
    }
}

extension ModelAssignmentScreen: ModelAssignmentScreenProtocol {
    func fetchingInformation() {
        networking.fetchRepresentItems { [weak self] response in
            guard let self = self else {
                print("ModelAssignmentScreen is deinitialized")
                return
            }
            
            switch response {
            case .success(let data):
                let array = self.mapper.parse(items: data)
                self.dataSource.observable = array
            case .failure(let error):
                let resultCheck = self.mapper.errorCheckingForInternetConnection(error)
                self.errorOccured.observable = resultCheck ? .notConnectedToInternet : .unknown
            }
        }
    }
    
    
}
