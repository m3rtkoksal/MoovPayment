//
//  CorporateData.swift
//  MoovPayment
//
//  Created by Mert Köksal on 11.09.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import Foundation

struct CorporateData {
    static func listData() -> [RowElement] {
        let testCard1 = RowElement(icon: "", title: "", subtitle: "")
        if testCard1.title == "" {
            return []
        } else {
            return[testCard1]
        }
    }
}
