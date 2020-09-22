//
//  CorporateAddressView.swift
//  MoovPayment
//
//  Created by Mert Köksal on 18.09.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import SwiftUI
import Combine
struct CorporateAddressView: View {
//    @Binding var isShown: Bool
    @State var corporateAddress: CorporateAddress
    @State var isSaved: Bool = false
    @State private(set) var addressNameText = ""
    @State private(set) var companyNameText = ""
    @State private(set) var taxNumberText = ""
    @State private(set) var taxOfficeText = ""
    @State private(set) var cityText = ""
    @State private(set) var countyText = ""
    @State private(set) var districtText = ""
    @State private(set) var addressText = ""
    var body: some View {
        VStack {
            AddressTextField(data: $addressNameText, captionText: "Adres Adi")
                .onReceive(Just(addressNameText)) { addressNameData in
                    if addressNameText.count > 1 {
                        self.corporateAddress.addressName = self.addressNameText
                    }
                }
            AddressTextField(data: $companyNameText, captionText: "Firma Adi")
                .onReceive(Just(companyNameText)) { companyNameData in
                    if companyNameText.count > 5 {
                        self.corporateAddress.companyName = self.companyNameText
                    }
                }
            AddressTextField(data: $taxNumberText, captionText: "Vergi No")
                .onReceive(Just(taxNumberText)) { taxNumberData in
                    if taxNumberText.count == 10 {
                        self.corporateAddress.taxNumber = self.taxNumberText
                    }
                }
            AddressTextField(data: $taxOfficeText, captionText: "Vergi Dairesi")
                .onReceive(Just(taxOfficeText)) { taxOfficeData in
                    if taxOfficeText.count > 5 {
                        self.corporateAddress.taxNumber = self.taxOfficeText
                    }
                }
            HStack {
                AddressTextField(data:$cityText, captionText: "Il")
                    .onReceive(Just(cityText)) { cityData in
                        if cityText.count > 3 {
                            self.corporateAddress.city = self.cityText
                        }
                    }
                AddressTextField(data:$countyText, captionText: "Ilce")
                    .onReceive(Just(countyText)) { countyData in
                        if countyText.count > 3 {
                            self.corporateAddress.county = self.countyText
                        }
                    }
            }
            AddressTextField(data:$districtText, captionText: "Semt")
                .onReceive(Just(districtText)) { districtData in
                    if districtText.count > 3 {
                        self.corporateAddress.district = self.districtText
                    }
                }
            AddressTextField(data:$addressText, captionText: "Adres")
                .onReceive(Just(addressText)) { addressData in
                    if addressText.count > 10 {
                        self.corporateAddress.address = self.addressText
                    }
                }
            Spacer()
        }
        .foregroundColor(.gray)
        .padding()
    }
}

struct CorporateAddressView_Previews: PreviewProvider {
    static var previews: some View {
        CorporateAddressView(corporateAddress: CorporateAddress(addressName: "Is", companyName: "Koksal", taxNumber: "123123", taxOffice: "Esenyali", city: "Istanbul", county: "Pendik", district: "Babula", address: "azanca cad. babafingo apt."))
    }
}
