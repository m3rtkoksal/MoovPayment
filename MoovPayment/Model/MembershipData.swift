//
//  TestData.swift
//  MoovPayment
//
//  Created by Mert Köksal on 11.09.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import Foundation

struct MembershipData {
    static func listData() -> [RowElement] {
        
        let testCard1 = RowElement(icon: Constants.IconNames.membership, title: "Test Karti 1", subtitle: "Duzenle")
        return[testCard1
        ]
    }
}
