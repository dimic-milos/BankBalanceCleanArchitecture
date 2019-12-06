//
//  Worker.swift
//  BankBalanceCleanArchitecture
//
//  Created by Dimic Milos on 11/29/19.
//  Copyright © 2019 Dimic Milos. All rights reserved.
//

import Foundation

class Worker: InteractorOutputDelegate {

    let stores: [StoreProtocol]

    init(stores: [StoreProtocol]) {
        self.stores = stores
    }

    func getBalance(completion: @escaping (Result<Double, Error>) -> ()) {
        
        stores.forEach {
            $0.getBalance { (result) in
                switch result {
                    
                case .success(let balance):
                    completion(.success(balance))
                case .failure(_):
                    break
                }
            }
        }
    }
}
