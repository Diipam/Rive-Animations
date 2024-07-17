//
//  OnBoardingScreen.swift
//  Rive Animations
//
//  Created by Deepam Dhakal on 17/07/2024.
//

import SwiftUI
import RiveRuntime

struct OnBoardingScreen: View {
    @State private var showModal = false
    let button = RiveViewModel(fileName: "button")
    var body: some View {
        NavigationStack {
            ZStack {
                Background()

                content

                Color("Shadow")
                    .opacity(showModal ? 0.4 : 0)
                    .ignoresSafeArea()

                if  showModal {
                    SignInView(showModal: $showModal)
                        .transition(.move(edge: .top).combined(with: .opacity))
                        .overlay {
                            Button {
                                withAnimation(.bouncy) {
                                    showModal.toggle()
                                }
                            } label: {
                                Image(systemName: "xmark")
                                    .frame(width: 36, height: 36)
                                    .foregroundStyle(.black)
                                    .background(.white)
                                    .mask(Circle())
                                .shadow(color: Color("Shadow"), radius: 5, x: 0, y: 3)
                            }
                            .frame(maxHeight: .infinity, alignment: .bottom)
                        }
                        .zIndex(1)
                }
            }
        }
    }

    var content: some View {

        VStack(alignment: .leading, spacing: 16) {
            Text("Learn design & code")
                .appFont(.largeTitle)
                .frame(width: 260, alignment: .leading)

            Text("Don't skip design. Learn design and code, by building real apps with Rive and Swift. Complete courses about the best tools")
                .appFont(.body)

            Spacer()

            button.view()
                .frame(width: 236, height: 64)
                .overlay {
                    Label("Start the Course", systemImage: "arrow.forward")
                        .foregroundStyle(.black)
                        .offset(x: 4, y: 4)
                        .font(.headline)
                }
                .background(
                    Color.black
                        .cornerRadius(30)
                        .blur(radius: 30)
                        .opacity(0.3)
                        .offset(y:10)
                )
                .onTapGesture {
                    button.play(animationName: "active")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        withAnimation(.spring) {
                            showModal.toggle()
                        }
                    }
                }

            Text("Purchase includes access to 30+ cources, 240+ premium tutotials, 120+ hours of videos, source files and certificates")
                .appFont(.footnote)
                .opacity(0.8)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(40)
        .padding(.top, 40)
    }
}

private struct Background: View {
    var body: some View {

        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 20)
            .background(
                Image("Spline")
                    .blur(radius: 50)
                    .offset(x: 200, y: 100)
            )
    }
}

#Preview {
    OnBoardingScreen()
}
