//
//  SignInView.swift
//  Rive Animations
//
//  Created by Deepam Dhakal on 17/07/2024.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 24) {
            Text("Sign In")
                .appFont(.largeTitle)

            Text("Access to 240+ hours of content. Learn design and code, by building real apps with React and Swift.")
                .appFont(.headline)

            VStack(alignment: .leading) {
                Text("Email")
                    .appFont(.subheadline)
                    .foregroundStyle(.secondary)
                TextField("Enter your email", text: $email)
                    .customtextField(imageIcon: "Icon Email")
            }

            VStack(alignment: .leading) {
                Text("Password")
                    .appFont(.subheadline)
                    .foregroundStyle(.secondary)
                SecureField("Enter your password", text: $password)
                    .customtextField(imageIcon: "Icon Lock")
            }

            Label("Sign In" , systemImage: "arrow.right")
                .appFont(.headline)
                .padding(15)
                .frame(maxWidth: .infinity)
                .background(Color(hex: "F77D8E"))
                .foregroundStyle(.white)
                .cornerRadius(radius: 20, corners: [.topRight, .bottomLeft, .bottomRight])
                .cornerRadius(radius: 8, corners: [.topLeft])
                .shadow(color: Color(hex: "F77D8E").opacity(0.5), radius: 10, x: 0, y: 5)

            HStack {
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(.black.opacity(0.1))
                Text("OR")
                    .appFont(.subheadline2)
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(.black.opacity(0.1))
            }

            Text("Sign up with Email, Apple or Google")
                .appFont(.subheadline)
                .foregroundStyle(.secondary)

            HStack {
                Image("Logo Email")
                Spacer()
                Image("Logo Apple")
                Spacer()
                Image("Logo Google")
            }
        }
        .padding(30)
        .background(.regularMaterial)
        .mask {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
        }
        .shadow(color: Color("Shadow").opacity(0.4), radius: 5, x: 0, y: 3)
        .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 30)
        .overlay {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(LinearGradient(colors: [.white.opacity(0.8), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
        }
        .padding()
    }
}

#Preview {
    SignInView()
}
