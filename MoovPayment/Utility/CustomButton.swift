//
//  CustomButton.swift
//  MoovPayment
//
//  Created by Mert Köksal on 11.09.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let icon : String
    let status: Color
    let width: CGFloat
    @State private var isDisabled = false
    var body: some View {
        ZStack(alignment:.bottom) {
            HStack {
                Text(title)
                    .foregroundColor(.white)
                    .font(Font.custom("SFCompactDisplay-Bold", size: 20))
                    .bold()
                    .fontWeight(.bold)
                    .fixedSize()
                Image(icon)
                    .renderingMode(.original)
                    .foregroundColor(.white)
                    .background(Color(.white))
            }
            .frame(width: width)
            .padding()
            .background(status)
        }
        .cornerRadius(10)
        
    }
    init(title: String, icon: Icon, status: Status, width: CGFloat) {
        self.title = title
        self.icon = icon.image
        if status == .enable {
            self.status = Color(#colorLiteral(red: 0, green: 0.6588235294, blue: 0.5254901961, alpha: 1))
        } else if status == .disable {
            self.status = Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        } else {
            self.status = Color(.white)
        }
        self.width = width
    }
}

enum Icon {
    case add
    case edit
    case none
    
    var image: String {
        switch self {
        case .add:
            return "Add"
        case .edit:
            return "Edit"
        case .none:
            return "empty"
        }
    }
}

enum Status {
    case enable
    case disable
    case inverse
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(title: "Listeden Sec", icon: .none, status: .enable, width: 150)
    }
}
