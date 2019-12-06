//
//  ChooseAccountOperationViewController.swift
//  BankBalanceCleanArchitecture
//
//  Created by Dimic Milos on 11/29/19.
//  Copyright © 2019 Dimic Milos. All rights reserved.
//

import UIKit

class ChooseAccountOperationViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToBankHours" {
            if let bankHoursViewController = segue.destination as? BankHoursViewController {
                bankHoursViewController.hours = "24/7"
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = .yellow
    }
    
    private func link(viewController: EnterUserIDViewController, interactor: Interactor, router: Router) -> EnterUserIDViewController {
        
        let presenter = Presenter(viewController: viewController)
        presenter.viewController = viewController
        let worker = Worker(stores: [CoreDataStore(), MemoryStore()])
        interactor.delegate = worker
        interactor.presenter =  presenter
        router.viewController = viewController
        
        return viewController
    }
    
    @IBAction func didTapButtonShowBalance(_ sender: UIButton) {
        let interactor = Interactor()
        let router = Router()
        let enterUserIDViewController = EnterUserIDViewController(interactor: interactor, router: router)
        show(link(viewController: enterUserIDViewController, interactor: interactor, router: router), sender: nil)
    }
    
    @IBAction func didTapButtonShowBankHours(_ sender: UIButton) {
        // classical segue connected
    }
    
    @IBSegueAction func didTapBurronShowBankLocations(coder: NSCoder) -> UIViewController? {
        return BankLocationsViewController(coder: coder, locations: "Belgrade, Leipzig")
    }
}

