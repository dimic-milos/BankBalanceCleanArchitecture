//
//  CoreDataStore.swift
//  BankBalanceCleanArchitecture
//
//  Created by Dimic Milos on 11/29/19.
//  Copyright © 2019 Dimic Milos. All rights reserved.
//

import Foundation
import CoreData

protocol StoreProtocol {
    func getBalance(completion: @escaping (Result<Double, Error>) -> ())
}

class CoreDataStore: StoreProtocol {
    
    func getBalance(completion: @escaping (Result<Double, Error>) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(.success(12.9787098708))
        }
    }

}
