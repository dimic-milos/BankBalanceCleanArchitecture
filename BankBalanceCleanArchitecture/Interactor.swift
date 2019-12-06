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

protocol InteractorOutputDelegate {
    func getBalance(completion: @escaping (Result<Double, Error>) -> ())
}

protocol InteractorOutput {
    func presentBalance(response: ShowBalance.Response)
}

class Interactor: InteractorInputProtocol {

    private let entity = Entity()
            var delegate: InteractorOutputDelegate?
            var output: InteractorOutput?
    
    func showBalance(request: ShowBalance.Request) {
        
        guard entity.canShowBalance(forID: request.id) else {
            return
        }
        
        delegate?.getBalance { (result) in
            switch result {
                
            case .success(let balance):
                self.output?.presentBalance(response: ShowBalance.Response(amount: balance))
            case .failure(_):
                break
            }
        }
    }

}
