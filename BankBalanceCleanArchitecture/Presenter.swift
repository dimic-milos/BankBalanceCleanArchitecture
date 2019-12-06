//
//  Presenter.swift
//  BankBalanceCleanArchitecture
//
//  Created by Dimic Milos on 11/29/19.
//  Copyright © 2019 Dimic Milos. All rights reserved.
//

import Foundation

protocol PresenterInputProtocol: class {
    func presentBalance(response: ShowBalance.Response)
}

protocol PresenterOutputProtocol {
    var  viewController: DisplayLogicProtocol? { get set }
}

class Presenter: PresenterInputProtocol, PresenterOutputProtocol {

    weak var viewController: DisplayLogicProtocol?
    
    init(viewController: DisplayLogicProtocol) {
        self.viewController = viewController
    }
    
    let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 3
        numberFormatter.numberStyle = .currency
        return numberFormatter
    }()
    
    func presentBalance(response: ShowBalance.Response) {
        let stringAmount = numberFormatter.string(from: NSNumber(value: response.amount))
        
        viewController?.display(viewModel: ShowBalance.ViewModel(saldo: stringAmount!))
    }
}
