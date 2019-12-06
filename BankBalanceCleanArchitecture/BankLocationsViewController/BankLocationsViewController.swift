//
//  BankLocationsViewController.swift
//  BankBalanceCleanArchitecture
//
//  Created by Dimic Milos on 11/29/19.
//  Copyright © 2019 Dimic Milos. All rights reserved.
//

import UIKit

class BankLocationsViewController: UIViewController {
    
    @IBOutlet weak var textFieldLocation: UITextField!
    
    private let locations: String
    
    init?(coder: NSCoder, locations: String) {
        self.locations = locations
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldLocation.text = locations
    }
    
}
