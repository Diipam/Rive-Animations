//
//  SignInView.swift
//  Rive Animations
//
//  Created by Deepam Dhakal on 17/07/2024.
//

import SwiftUI
import RiveRuntime

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @FocusState private var isFocused: Bool
    @State private var isLoading = false
    @Binding var showModal: Bool
    let check = RiveViewModel(fileName: "check")
    let celebration = RiveViewModel(fileName: "confetti")

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
                    .focused($isFocused)

            }

            VStack(alignment: .leading) {
                Text("Password")
                    .appFont(.subheadline)
                    .foregroundStyle(.secondary)
                SecureField("Enter your password", text: $password)
                    .customtextField(imageIcon: "Icon Lock")
            }

            Button {
               validate()
            } label: {
                Label("Sign In" , systemImage: "arrow.right")
                    .appFont(.headline)
                    .padding(15)
                    .frame(maxWidth: .infinity)
                    .background(Color(hex: "F77D8E"))
                    .foregroundStyle(.white)
                    .cornerRadius(radius: 20, corners: [.topRight, .bottomLeft, .bottomRight])
                    .cornerRadius(radius: 8, corners: [.topLeft])
                    .shadow(color: Color(hex: "F77D8E").opacity(0.5), radius: 10, x: 0, y: 5)
            }

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
        .overlay {
            ZStack{
                if isLoading {
                    check.view()
                        .frame(width: 100, height: 100)
                        .allowsHitTesting(false)
                }
                celebration.view()
                    .scaleEffect(3)
                    .allowsHitTesting(false)
            }
        }
    }

    func validate() {
        isLoading = true

        if email != "" {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                check.triggerInput("Check")
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isLoading = false
                celebration.triggerInput("Trigger explosion")
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                withAnimation(.spring) {
                    showModal = false
                }
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                check.triggerInput("Error")
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isLoading = false
            }
        }
    }
}

#Preview {
    SignInView(showModal: .constant(true))
}
