//
//  AddressTextField.swift
//  MoovPayment
//
//  Created by Mert Köksal on 18.09.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import SwiftUI

struct AddressTextField: View {
    @Binding var data : String
    var captionText: String
    var body: some View {
        HStack {
            Text(captionText)
                .font(Font.custom("SFCompactDisplay", size: 16))
                .foregroundColor(.black)
                .padding()
            TextField("Zorunlu", text: $data)
                .padding()
                .foregroundColor(.black)
        }
        .background(RoundedRectangle(cornerRadius: 10))
        .foregroundColor(Color(#colorLiteral(red: 0.9647058824, green: 0.9725490196, blue: 0.9882352941, alpha: 1)))
        .frame(height: 58)
    }
}

struct AddressTextField_Previews: PreviewProvider {
    static var previews: some View {
        AddressTextField(data: .constant(""), captionText: "Adres Adi")
    }
}
