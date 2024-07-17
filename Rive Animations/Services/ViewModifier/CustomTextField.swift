//
//  CustomTextField.swift
//  Rive Animations
//
//  Created by Deepam Dhakal on 17/07/2024.
//

import SwiftUI

struct CustomTextField: ViewModifier {
    let imageIcon: String
    func body(content: Content) -> some View {
        content
            .padding(15)
            .padding(.leading, 35)
            .background(.white)
            .mask {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .stroke()
                    .fill(.black.opacity(0.1))
            }
            .overlay {
                Image(imageIcon)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 8)
            }
    }
}

extension View {
    func customtextField(imageIcon: String) -> some View {
        modifier(CustomTextField(imageIcon: imageIcon))
    }
}
