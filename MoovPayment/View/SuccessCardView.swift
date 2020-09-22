//
//  SuccessCardView.swift
//  MoovPayment
//
//  Created by Mert Köksal on 17.09.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import SwiftUI

struct SuccessCardView: View {
    @Binding var isShown: Bool
    @State var viewState = CGSize.zero
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6588235294, blue: 0.5254901961, alpha: 1)))
                    .cornerRadius(10)
                    .frame(width: 355, height: 76)
                HStack {
                    VStack(alignment: .leading) {
                        Text("Tebrikler!")
                            .font(Font.custom("SFCompactDisplay-Bold", size: 16))
                            .foregroundColor(.white)
                        Text("Kart Basariyla Eklendi")
                            .font(Font.custom("SFCompactDisplay", size: 14))
                            .foregroundColor(.white)
                    }
                    .offset(x: -70)
                }
            }
            Spacer()
        }
        .offset(y: isShown ? .zero : -UIScreen.main.bounds.size.height)
        .offset(y: viewState.height )
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .offset(y: -100)
    }
}

struct SuccessCardView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessCardView(isShown: .constant(false))
    }
}
