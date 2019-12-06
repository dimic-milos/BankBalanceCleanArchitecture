//
//  Interactor.swift
//  BankBalanceCleanArchitecture
//
//  Created by Dimic Milos on 11/29/19.
//  Copyright © 2019 Dimic Milos. All rights reserved.
//

import Foundation
import Entity

protocol InteractorRequest {
    func showBalance(request: ShowBalance.Request)
}

protocol InteractorWorker {
    func getBalance(completion: @escaping (Result<Double, Error>) -> ())
}

protocol InteractorPresenter {
    func presentBalance(response: ShowBalance.Response)
}

class Interactor: InteractorRequest {

    private let entity = Entity()
            var worker: InteractorWorker?
            var presenter: InteractorPresenter?
    
    func showBalance(request: ShowBalance.Request) {
        
        guard entity.canShowBalance(forID: request.id) else {
            return
        }
        
        worker?.getBalance { (result) in
            switch result {
                
            case .success(let balance):
                self.presenter?.presentBalance(response: ShowBalance.Response(amount: balance))
            case .failure(_):
                break
            }
        }
    }

}
