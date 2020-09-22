//
//  CustomTextField.swift
//  MoovPayment
//
//  Created by Mert Köksal on 14.09.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import SwiftUI

struct CreditCardTextField: View {
    @Binding var data : String
    var tFtext: String = ""
    var tFImage: String = ""
    var body: some View {
        HStack {
                Image(tFImage)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding()
                TextField(tFtext, text: $data)
                    .padding()
                    .font(Font.custom("SFCompactDisplay", size: 16))
                    .foregroundColor(.black)
            }
            .background(RoundedRectangle(cornerRadius: 10))
            .foregroundColor(Color(#colorLiteral(red: 0.9647058824, green: 0.9725490196, blue: 0.9882352941, alpha: 1)))
            .frame(height: 58)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CreditCardTextField(data: .constant(""), tFtext: "Kartin Uzerindeki Isim", tFImage: "user")
    }
}
