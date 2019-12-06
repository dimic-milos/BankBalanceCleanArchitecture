//
//  MemoryStore.swift
//  BankBalanceCleanArchitecture
//
//  Created by Dimic Milos on 11/29/19.
//  Copyright © 2019 Dimic Milos. All rights reserved.
//

import Foundation

class MemoryStore: StoreProtocol {
    func getBalance(completion: @escaping (Result<Double, Error>) -> ()) {
        DispatchQueue.main.async {
            completion(.success(9.34224565))
        }
    }
}
