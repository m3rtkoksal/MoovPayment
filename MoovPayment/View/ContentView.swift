//
//  ContentView.swift
//  MoovPayment
//
//  Created by Mert Köksal on 10.09.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let membershipRows = MembershipData.listData()
    let corporateRows = CorporateData.listData()
    let otherOperationRows = OtherOperationsData.listData()
    @State var selectedCard = CreditCard(cardOwnerName: "", cardNumber: "", cardExpMonth: "", cardExpYear: "", cardName: "", ccv: "")
    @State var shown: Bool = false
    init() {
            UITableView.appearance().backgroundColor = .white // Uses UIColor
        }
    var body: some View {
        NavigationView {
                VStack {
                    if self.membershipRows.count == 0 {
                        VStack {
                            Spacer()
                            Image("emptyView")
                                .resizable()
                                .frame(width: 269, height: 202)
                            VStack(spacing: 20) {
                                Text("Odeme Yontemi Yok")
                                    .font(Font.custom("SFCompactDisplay-Bold", size: 24))
                                Text("Kiralama yapabilmek icin odeme yontemi eklemelisin")
                                    .font(Font.custom("SFCompactDisplay", size: 14))
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Button(action: {
                                self.shown.toggle()
                            }, label: { CustomButton(title: "Odeme Yontemi Ekle", icon: .none, status: .enable, width: 300)
                            })
                            NavigationLink("", destination: AddCreditCardView(creditCard: selectedCard), isActive: $shown)
                        }
                        .navigationBarTitle("Odeme Yontemleri", displayMode: .inline)
                        .font(Font.custom("SFCompactDisplay", size: 16))
                    } else {
                        List {
                            Section(header: Text("Bireysel")) {
                                ForEach(membershipRows) { row in
                                    NavigationLink(destination: CreditCardView()) {
                                        RowElementView(row: row)
                                    }
                                }
                            }
                            if self.corporateRows.count == 0
                            {
                                Rectangle()
                                    .background(Color(.white))
                                    .edgesIgnoringSafeArea(.all)
                                    .foregroundColor(.white)
                                    .padding(.vertical,32)
        
                            }
                            Section(header: Text("Diger Islemler")) {
                                ForEach(otherOperationRows) { row in
                                    RowElementView(row: row)
                                }
                            }
                           
                        }
        
                        .edgesIgnoringSafeArea(.all)
                        .navigationBarTitle("Odeme Yontemleri", displayMode: .inline)
                        .font(Font.custom("SFCompactDisplay", size: 16))
                        NavigationLink("", destination: AddCreditCardView(creditCard: selectedCard), isActive: $shown)
                        Button(action: {
                            self.shown.toggle()
                        }, label: { CustomButton(title: "Odeme Yontemi Ekle", icon: .none, status: .enable, width: 350)
                        })
                    }
                }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

