//
//  Models.swift
//  BankBalanceCleanArchitecture
//
//  Created by Dimic Milos on 11/29/19.
//  Copyright © 2019 Dimic Milos. All rights reserved.
//

import Foundation

struct ShowBalance {
    struct Request {
        let id: Int
    }
    struct Response {
        let amount: Double
    }
    struct ViewModel {
        let saldo: String
    }
}
