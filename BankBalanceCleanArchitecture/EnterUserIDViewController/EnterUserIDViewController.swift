//
//  EnterUserIDViewController.swift
//  BankBalanceCleanArchitecture
//
//  Created by Dimic Milos on 11/29/19.
//  Copyright © 2019 Dimic Milos. All rights reserved.
//

import UIKit

protocol DisplayLogicProtocol: class {
    func display(viewModel: ShowBalance.ViewModel)
}

class EnterUserIDViewController: UIViewController, DisplayLogicProtocol {
    
    @IBOutlet weak var textFieldID: UITextField!
    
    private var interactor: InteractorInputProtocol
    private var router: RouterProtocol
    
    init(interactor: InteractorInputProtocol, router: RouterProtocol) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func didTapButtonGo(_ sender: UIButton) {
        interactor.showBalance(request: ShowBalance.Request(id: 1))
    }
    
    func display(viewModel: ShowBalance.ViewModel) {
        router.routeToDisplaySaldo(string: viewModel.saldo)
    }
    
}
