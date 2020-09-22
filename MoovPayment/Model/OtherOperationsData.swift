//
//  OtherOperationsData.swift
//  MoovPayment
//
//  Created by Mert Köksal on 11.09.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import Foundation

struct OtherOperationsData {
    static func listData() -> [RowElement] {
    
    let creditCardTransactions = RowElement(icon: Constants.IconNames.credit, title: "Kredi Karti Islemleri", subtitle: "")
    let billAddressOperations = RowElement(icon: Constants.IconNames.location, title: "Fatura Adresi Islemleri", subtitle: "")
    let paymentHistory = RowElement(icon: Constants.IconNames.past, title: "Odeme Gecmisi", subtitle: "")
        
        return [creditCardTransactions,billAddressOperations,paymentHistory]
    }
    
}
