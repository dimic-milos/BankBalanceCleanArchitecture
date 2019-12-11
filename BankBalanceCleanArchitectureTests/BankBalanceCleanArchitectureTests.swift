//
//  BankBalanceCleanArchitectureTests.swift
//  BankBalanceCleanArchitectureTests
//
//  Created by Dimic Milos on 11/29/19.
//  Copyright © 2019 Dimic Milos. All rights reserved.
//

import XCTest
import Interactor
@testable import BankBalanceCleanArchitecture

class BankBalanceCleanArchitectureTests: XCTestCase {


    func test_presentBalance() {
        // Given
        let viewController = PresentLogicSpy()
        let presenter = Presenter(viewController: viewController)
        presenter.viewController = viewController
        
        // When
        presenter.presentBalance(response: ShowBalance.Response(amount: 1))
        
        // Then
        XCTAssertTrue(viewController.isCalled)
        
    }
    
    class PresentLogicSpy: PresentLogic {
        var isCalled = false
        func display(viewModel: ShowBalance.ViewModel) {
            isCalled = true
        }
        
        
    }

}
