//
//  CreditCardDateTextField.swift
//  MoovPayment
//
//  Created by Mert Köksal on 14.09.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import SwiftUI

struct CreditCardDateTextField: View {
    var tFtext: String = ""
    var tFImage: String = ""
    @Binding var month : String
    @Binding var year : String
    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                Image(tFImage)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding()
                HStack {
                    TextField("**",text: $month)
                        .frame(width: 25, height: 24)
                        .foregroundColor(.black)
                        .fixedSize()
                    Text("/")
                        .foregroundColor(.gray)
                        .frame(width: 5, height: 24)
                    TextField("**", text: $year)
                    .frame(width: 45, height: 24)
                    .foregroundColor(.black)
                        .fixedSize()
                }
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .background(RoundedRectangle(cornerRadius: 10))
        .foregroundColor(Color(#colorLiteral(red: 0.9647058824, green: 0.9725490196, blue: 0.9882352941, alpha: 1)))
    }
}

struct CreditCardDateTextField_Previews: PreviewProvider {
    static var previews: some View {
        CreditCardDateTextField(tFImage: "date", month: .constant(""), year: .constant(""))
    }
}
