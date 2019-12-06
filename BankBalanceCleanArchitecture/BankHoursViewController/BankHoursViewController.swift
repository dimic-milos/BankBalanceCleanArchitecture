//
//  BankHoursViewController.swift
//  BankBalanceCleanArchitecture
//
//  Created by Dimic Milos on 11/29/19.
//  Copyright © 2019 Dimic Milos. All rights reserved.
//

import UIKit

class BankHoursViewController: UIViewController {
    
    @IBOutlet weak var labelHours: UILabel!
    
    var hours: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelHours.text = hours
    }
    
    @IBAction func buttonShowBankLocationsTapped(_ sender: UIButton) {
        let storyboardMain  = UIStoryboard(name: "Main", bundle: nil)
        let bankLocationsViewController = storyboardMain.instantiateViewController(identifier: "BankLocationsViewController") { (coder) -> UIViewController? in
            return BankLocationsViewController(coder: coder, locations: "This is shown from Bank Hours VC")
            
        }
        show(bankLocationsViewController, sender: nil)
    }
    
}
