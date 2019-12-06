//
//  Router.swift
//  BankBalanceCleanArchitecture
//
//  Created by Dimic Milos on 11/29/19.
//  Copyright © 2019 Dimic Milos. All rights reserved.
//

import UIKit

protocol RouterProtocol {
    var  viewController: UIViewController? { get set }
    func routeToDisplaySaldo(string: String)
}

class Router: RouterProtocol {
    
    weak var viewController: UIViewController?
    
    func routeToDisplaySaldo(string: String) {
        let storyboardMain  = UIStoryboard(name: "Main", bundle: nil)
        let bankLocationsViewController = storyboardMain.instantiateViewController(identifier: "BankLocationsViewController") { (coder) -> UIViewController? in
            return BankLocationsViewController(coder: coder, locations: string)
            
        }
        viewController?.show(bankLocationsViewController, sender: nil)
    }
}
