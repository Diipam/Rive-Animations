//
//  ContentView.swift
//  Rive Animations
//
//  Created by Smart Solar Nepal on 18/07/2024.
//

import SwiftUI
import RiveRuntime

struct ContentView: View {
    @AppStorage("selectedtab") var selectedTab: Tab = .chat
    @State private var isOpen = false
    let button = RiveViewModel(fileName: "menu_button", autoPlay: false)

    var body: some View {
        ZStack {

            Group {
                switch selectedTab {
                case .chat:
                    HomeView()
                case .search:
                    Text("Search")

                case .timer:
                    Text("timer")

                case .bell:
                    Text("bell")

                case .user:
                    Text("user")

                }
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 80)

            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 104)
            }
            .ignoresSafeArea()


            button.view()
                .frame(width: 44, height: 44)
                .mask(Circle())
                .shadow(color: Color("Shadow").opacity(0.6), radius: 5, x: 0, y: 5)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                .onTapGesture {
                    button.setInput("isOpen", value: isOpen)
                    isOpen.toggle()
                }

            TabbarView()
        }
    }
}

#Preview {
    ContentView()
}
