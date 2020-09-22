//
//  CreditCards.swift
//  MoovPayment
//
//  Created by Mert Köksal on 21.09.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import SwiftUI

class CreditCard: ObservableObject, Identifiable {
    @Published var _id: String = UUID().uuidString
    @Published var _cardOwnerName : String = ""
    @Published var _cardNumber: String = ""
    @Published var _cardExpMonth: String = ""
    @Published var _cardExpYear: String = ""
    @Published var _cardName: String = ""
    @Published var _ccv: String = ""
    
    init(cardOwnerName: String, cardNumber: String, cardExpMonth: String,cardExpYear: String, cardName:String, ccv:String)
        {
            self._cardOwnerName = cardOwnerName
            self._cardNumber = cardNumber
            self._cardExpMonth = cardExpMonth
            self._cardExpYear = cardExpYear
            self._cardName = cardName
            self._ccv = ccv
        }
}

class CreditCardArray: ObservableObject {
    @Published var items = [CreditCard]()
    
    
    func appendNewCreditCard(cardOwnerName: String, cardNumber: String, cardExpMonth: String,cardExpYear: String, cardName:String, ccv:String) {
        objectWillChange.send()
        items.append(CreditCard(cardOwnerName: cardOwnerName, cardNumber: cardNumber, cardExpMonth: cardNumber, cardExpYear: cardExpYear, cardName: cardName, ccv: ccv))
    }
}

