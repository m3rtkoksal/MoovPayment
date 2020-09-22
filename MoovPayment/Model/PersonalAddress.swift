//
//  Address.swift
//  MoovPayment
//
//  Created by Mert Köksal on 18.09.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import SwiftUI

struct PersonalAddress: Identifiable {
    var id: String = UUID().uuidString
    var addressName: String
    var nameSurname: String
    var city: String
    var county: String
    var district: String
    var address: String
}

