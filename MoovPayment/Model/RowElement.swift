//
//  RowElement.swift
//  MoovPayment
//
//  Created by Mert Köksal on 11.09.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import SwiftUI

struct RowElement: Identifiable {
    var id: String = UUID().uuidString
    var icon: String
    var title: String
    var subtitle: String
    
    init(icon: String, title: String, subtitle: String) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
    }
}

