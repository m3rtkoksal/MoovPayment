//
//  PaymentMethodView.swift
//  MoovPayment
//
//  Created by Mert Köksal on 21.09.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import SwiftUI

struct PaymentMethodView: View {
    @ObservedObject var creditCards = CreditCardArray()
    var body: some View {
        VStack {
            TopBarPM()
            MiddleView()
                .padding()
            DetailLine()
            VStack {
                HStack {
                    Image("credit")
                    VStack {
                        ForEach(creditCards.items) { item in
                            Text(item._cardName)
                    }
                }
            }
            Spacer()
        }
    }
}
struct TopBarPM : View {
    var body: some View {
        VStack {
            HStack() {
                Image("addcreditcard")
                Image("lineColored")
                Image("locationColored")
                Image("lineColored")
                Image("check-circle-colored")
            }
            .padding(.horizontal,62)
            VStack {
                Text("Odeme Yontemi Olustur")
                    .font(Font.custom("SFCompactDisplay-Bold", size: 14))
                Text("3. Adim")
                    .font(Font.custom("SFCompactDisplay", size: 14))
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}

struct DetailLine: View {
    var body: some View {
        ZStack{
            Image("lineStraight")
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray, lineWidth: 2)
                        .frame(width: 78, height: 20, alignment: .center)
                        .background(Color.white)
            )
            Text("Detaylar")
                .font(Font.custom("SFCompactDisplay", size: 12))
                .foregroundColor(.gray)
        }
    }
}

struct MiddleView: View {
    @State private(set) var paymentNameText = ""
    var body: some View {
        VStack {
            CreditCardTextField(data: $paymentNameText, tFtext: "Odeme Yontemi Adi", tFImage: "cardEdit")
        }
    }
}

struct PaymentMethodView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMethodView()
    }
}

}
