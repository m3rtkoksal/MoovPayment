//
//  PersonalAddressView.swift
//  MoovPayment
//
//  Created by Mert Köksal on 18.09.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import SwiftUI
import Combine
struct PersonalAddressView: View {
//    @Binding var isShown: Bool
    @State var personalAddress: PersonalAddress
    @State var isSaved: Bool = false
    @State private(set) var addressNameText = ""
    @State private(set) var nameSurnameText = ""
    @State private(set) var cityText = ""
    @State private(set) var countyText = ""
    @State private(set) var districtText = ""
    @State private(set) var addressText = ""
    var body: some View {
        VStack {
            AddressTextField(data: $addressNameText, captionText: "Adres Adi")
                .onReceive(Just(addressNameText)) { addressNameData in
                    if addressNameText.count > 1 {
                        self.personalAddress.addressName = self.addressNameText
                    }
                }
            AddressTextField(data:$nameSurnameText, captionText: "Ad-Soyad")
                .onReceive(Just(nameSurnameText)) { nameSurnameData in
                    if nameSurnameText.count > 6 {
                        self.personalAddress.nameSurname = self.addressNameText
                    }
                }
            HStack {
                AddressTextField(data:$cityText, captionText: "Il")
                    .onReceive(Just(cityText)) { cityData in
                        if cityText.count > 3 {
                            self.personalAddress.city = self.cityText
                        }
                    }
                AddressTextField(data:$countyText, captionText: "Ilce")
                    .onReceive(Just(countyText)) { countyData in
                        if countyText.count > 3 {
                            self.personalAddress.county = self.countyText
                        }
                    }
            }
            AddressTextField(data:$districtText, captionText: "Semt")
                .onReceive(Just(districtText)) { districtData in
                    if districtText.count > 3 {
                        self.personalAddress.district = self.districtText
                    }
                }
            AddressTextField(data:$addressText, captionText: "Adres")
                .onReceive(Just(addressText)) { addressData in
                    if addressText.count > 10 {
                        self.personalAddress.address = self.addressText
                    }
                }
            Spacer()
            
        }
        .padding()
    }
}

struct PersonalAddressView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalAddressView(personalAddress: PersonalAddress(addressName: "Ev", nameSurname: "Mert Koksal", city: "Istanbul", county: "Tuzla", district: "Aydintepe", address: "Evora Sit. E3-166"))
    }
}

