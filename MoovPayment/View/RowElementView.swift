//
//  RowView.swift
//  MoovPayment
//
//  Created by Mert Köksal on 11.09.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import SwiftUI

struct RowElementView: View {
    var row: RowElement
    var body: some View {
        HStack(spacing: 35) {
            Image(row.icon)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 19.5, height: 19.5)
            Text(row.title)
                .font(Font.custom("SFCompactDisplay", size: 16))
                .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.1960784314, blue: 0.2352941176, alpha: 1)))
                .fontWeight(.bold)
            Spacer()
            HStack {
                Text(row.subtitle)
                    .font(Font.custom("SFCompactDisplay", size: 14))
                    .foregroundColor(Color(#colorLiteral(red: 0.568627451, green: 0.568627451, blue: 0.5764705882, alpha: 1)))
                    .fontWeight(.light)
            }
        }
    }
}

struct RowElementView_Previews: PreviewProvider {
    static var previews: some View {
        RowElementView(row: RowElement(icon: Constants.IconNames.membership, title: "Test Kart 1", subtitle: "Duzenle"))
    }
}
