//
//  AddAddressView.swift
//  MoovPayment
//
//  Created by Mert Köksal on 17.09.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import SwiftUI

struct AddAddressView: View {
    @State var personalAddress: PersonalAddress
    var body: some View {
        VStack {
            TopBarAA()
            AddressSegment()
            Spacer()
        }
        .navigationBarTitle("Odeme Yontemi", displayMode: .inline)
        
    }
}

struct TopBarAA : View {
    var body: some View {
        VStack {
            HStack() {
                Image("addcreditcard")
                Image("lineColored")
                Image("locationColored")
                Image("line")
                Image("check-circle")
            }
            .padding(.horizontal,62)
            VStack {
                Text("Fatura Adresi Ekle")
                    .font(Font.custom("SFCompactDisplay-Bold", size: 14))
                Text("2. Adim")
                    .font(Font.custom("SFCompactDisplay", size: 14))
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}

struct AddressSegment : View {
    @State var personalAddress = PersonalAddress(id: "", addressName: "", nameSurname: "", city: "", county: "", district: "", address: "")
    @State var corporateAddress = CorporateAddress(id: "", addressName: "", companyName: "", taxNumber: "", taxOffice: "", city: "", county: "", district: "", address: "")
    @State var personalAddresses = [PersonalAddress]()
    @State var corporateAddresses = [CorporateAddress]()
    @State var isSaved: Bool = false
    @State var showPaymentMethod: Bool = false
    @State var isListTapped: Bool = false
    @State private var showingPersonalAddress = false
    @State private var showingCorporateAddress = false
    @State private var selectorIndex = 0
    @State private var options = ["Bireysel","Kurumsal"]
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = #colorLiteral(red: 0.05490196078, green: 0.3254901961, blue: 0.368627451, alpha: 1)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.init(displayP3Red: 0.05490196078, green: 0.3254901961, blue: 0.368627451, alpha: 1)], for: .normal)
    }
    var body: some View {
        ZStack {
            VStack {
                Picker("Addresses", selection: $selectorIndex) {
                    ForEach(0..<options.count) { index in
                        Text(self.options[index]).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 216, height: 28, alignment: .center)
                .cornerRadius(5)
                .foregroundColor(.white)
                Spacer()
                
                if selectorIndex == 0 {
                    PersonalAddressView(personalAddress: personalAddress)
                } else {
                    CorporateAddressView(corporateAddress: corporateAddress)
                }
                HStack {
                    Button(action: {
                        self.isListTapped.toggle()
                    },label: { CustomButton(title: "Listeden Sec", icon: .none, status: .enable, width: 150)})
                    NavigationLink("", destination: PaymentMethodView(), isActive: $showPaymentMethod)
                    Button(action:  {
                        self.showPaymentMethod = true
                        self.isSaved.toggle()
                        if selectorIndex == 0 {
                        self.personalAddresses.append(self.personalAddress)
                        } else {
                            self.corporateAddresses.append(contentsOf: self.corporateAddresses)
                        }
                        
                    },label: { CustomButton(title: "Kaydet", icon: .none, status: .enable, width: 150)})
                }
            }
        }
    }
}

struct AddAddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddAddressView(personalAddress: PersonalAddress(addressName: "Ev", nameSurname: "Mert Koksal", city: "Istanbul", county: "Tuzla", district: "Aydintepe", address: "Evora Sitesi E3-166"))
    }
}
