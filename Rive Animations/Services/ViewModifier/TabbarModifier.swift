//
//  TabbarModifier.swift
//  Rive Animations
//
//  Created by Smart Solar Nepal on 18/07/2024.
//

import SwiftUI

struct TabbarModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(12)
            .background(Color("Background 2").opacity(0.8))
            .background(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .shadow(color: Color("Background 2").opacity(0.3), radius: 20, x: 0, y: 20)
            .overlay(content: {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .stroke(.linearGradient(colors: [.white.opacity(0.5), .white.opacity(0)], startPoint: .topLeading, endPoint: .bottomTrailing))
            })
            .padding(.horizontal, 24)

    }

}

extension View {
    func tabbarModifer() -> some View {
        modifier(TabbarModifier())
    }
}
