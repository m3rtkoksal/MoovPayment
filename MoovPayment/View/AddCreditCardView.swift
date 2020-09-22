//
//  AddCreditCardView.swift
//  MoovPayment
//
//  Created by Mert Köksal on 14.09.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import SwiftUI
import Combine

struct AddCreditCardView: View {
    var creditCard: CreditCard
    @State var isChooseFromList: Bool = false
    
    var body: some View {
            VStack {
                TopBarCC()
                Spacer()
                CardInfo(creditCard: creditCard, isSaved: false)
                Spacer()
        }
        .navigationBarTitle("Odeme Yontemi", displayMode: .inline)
    }
}

struct TopBarCC : View {
    var body: some View {
        VStack {
            HStack() {
                Image("addcreditcard")
                Image("line")
                Image("locationBar")
                Image("line")
                Image("check-circle")
            }
            .padding(.horizontal,62)
            VStack {
                Text("Kredi Karti Ekle")
                    .font(Font.custom("SFCompactDisplay-Bold", size: 14))
                Text("1. Adim")
                    .font(Font.custom("SFCompactDisplay", size: 14))
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}

struct CardInfo : View {
    @State var creditCard : CreditCard
    @ObservedObject var creditCards = CreditCardArray()
    @State var isSaved: Bool = false
    @State var isListTapped: Bool = false
    @State private var showingAlert = false
    @State private(set) var successAlert = false
    @State private(set) var showAddressView = false
    @State private(set) var cardOwnerText = ""
    @State private(set) var cardNumberText = ""
    @State private(set) var ccvText = ""
    @State private(set) var cardNameText = ""
    @State private(set) var cardExpMonthText = ""
    @State private(set) var cardExpYearText = ""
    
    var body: some View {
        ZStack {
            VStack {
                CreditCardTextField(data: $cardOwnerText, tFtext: "Kartin Uzerindeki Isim", tFImage: "user")
                    .textContentType(.givenName)
                    .onReceive(Just(cardOwnerText)) { cardOwnerNameData in
                        if cardOwnerNameData.count > 5 {
                            self.creditCard._cardOwnerName = self.cardOwnerText
                        }
                }
                CreditCardTextField(data: $cardNumberText, tFtext: "Kredi Kart Numarasi", tFImage: "credit")
                    .textContentType(.oneTimeCode)
                    .keyboardType(.numberPad)
                    .onReceive(Just(cardNumberText)) { cardNumberdata in
                        if cardNumberdata.count == 16 {
                            self.creditCard._cardNumber = self.cardNumberText
                        }
                }
                HStack {
                    CreditCardDateTextField(tFImage: "date",month: $cardExpMonthText, year: $cardExpYearText)
                        .textContentType(.creditCardNumber)
                        .keyboardType(.numberPad)
                        .onReceive(Just(cardExpMonthText)) { (cardExpMonthData) in
                            if cardExpMonthData.count == 2 {
                                self.creditCard._cardExpMonth = self.cardExpMonthText
                            }
                    }
                    .onReceive(Just(cardExpYearText)) { (cardExpYeardata) in
                        if cardExpYeardata.count == 2 {
                            self.creditCard._cardExpYear = self.cardExpYearText
                        }
                    }
                    Spacer()
                    Text("")
                        .overlay(
                            Rectangle()
                                .frame(width: 70, height: 56))
                    Text("|")
                        .foregroundColor(.black)
                    CreditCardTextField(data: $ccvText, tFtext: "CCV", tFImage: "")
                        .textContentType(.creditCardNumber)
                        .onReceive(Just(ccvText)) { (cardCcvData) in
                            if cardCcvData.count == 3 {
                                self.creditCard._ccv = self.ccvText
                            }
                    }
                }
                .foregroundColor(Color(#colorLiteral(red: 0.9647058824, green: 0.9725490196, blue: 0.9882352941, alpha: 1)))
                CreditCardTextField(data: $cardNameText, tFtext: "Kart Ismi", tFImage: "cardEdit")
                    .onReceive(Just(cardNameText)) { (cardNameData) in
                        if cardNameData.count > 1 {
                            self.creditCard._cardName = self.cardNameText
                        }
                }
                Spacer()
                HStack {
                    Button(action: {
                        self.isListTapped.toggle()
                    }, label: { CustomButton(title: "Listeden Sec", icon: .none, status: .enable, width: 150)})
                    NavigationLink("", destination: AddAddressView(personalAddress: PersonalAddress(addressName: "", nameSurname: "", city: "", county: "", district: "", address: "")), isActive: $showAddressView)
                    Button(action: {
                        self.isSaved.toggle()
                        self.creditCards.objectWillChange.send()
                        self.creditCards.appendNewCreditCard(cardOwnerName: self.cardOwnerText, cardNumber: self.cardNumberText, cardExpMonth: self.cardExpMonthText, cardExpYear: self.cardExpYearText, cardName: self.cardNameText, ccv: self.ccvText)
                        if self.creditCard._cardNumber == "" {
                            self.showingAlert = true
                        } else if self.creditCard._cardNumber.count == 16 {
                            self.successAlert = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                               self.successAlert = false    // hide popup
                               self.showAddressView = true    // eg. activate navigation link
                            }
                        }
                    }, label: { CustomButton(title: "Kaydet", icon: .none, status: .enable, width: 150)})
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("Kart Bilgileri Hatali"), message: Text("Tekrar Kontrol Edin"), dismissButton: .default(Text("Got it!")))
                    }
                }
           
           
                
            }
            .edgesIgnoringSafeArea(.all)
            .padding()
                SuccessCardView(isShown: $successAlert)
             
           
        }
        .padding()
    }
}

struct AddCreditCardView_Previews: PreviewProvider {
    static var previews: some View {
        AddCreditCardView(creditCard: CreditCard(cardOwnerName: "", cardNumber: "", cardExpMonth: "", cardExpYear: "", cardName: "", ccv: ""))
    }
}
