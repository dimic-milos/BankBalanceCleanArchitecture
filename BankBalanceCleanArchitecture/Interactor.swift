//
//  Interactor.swift
//  BankBalanceCleanArchitecture
//
//  Created by Dimic Milos on 11/29/19.
//  Copyright © 2019 Dimic Milos. All rights reserved.
//

import Foundation
import Entity

protocol InteractorInputProtocol {
    func showBalance(request: ShowBalance.Request)
}

protocol InteractorOutputProtocol {
    var presenter: PresenterInputProtocol? { get set }
}

class Interactor: InteractorInputProtocol, InteractorOutputProtocol {

    private let entity = Entity()
    private let worker: WorkerInputProtocol = Worker(stores: [CoreDataStore(), MemoryStore()])
            var presenter: PresenterInputProtocol?
    
    func showBalance(request: ShowBalance.Request) {
        
        guard entity.canShowBalance(forID: request.id) else {
            return
        }
        
        worker.getBalance { (result) in
            switch result {
                
            case .success(let balance):
                self.presenter?.presentBalance(response: ShowBalance.Response(amount: balance))
            case .failure(_):
                break
            }
        }
    }

}
