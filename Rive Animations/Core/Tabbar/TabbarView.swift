//
//  TabbarView.swift
//  Rive Animations
//
//  Created by Smart Solar Nepal on 18/07/2024.
//

import SwiftUI
import RiveRuntime

struct TabbarView: View {
    @AppStorage("selectedtab") var selectedTab: Tab = .chat
    let icon = RiveViewModel(fileName: "icons")

    var body: some View {
        VStack {
            Spacer()
            tabbarContent
                .tabbarModifer()
        }
    }

    var tabbarContent: some View {
        HStack{
            ForEach(tabItems) { item in
                Button {
                    item.icon.setInput("active", value: true)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        item.icon.setInput("active", value: false)
                    }
                    withAnimation {
                        selectedTab = item.tab
                    }
                } label: {
                    item.icon.view()
                        .frame(height: 36)
                        .opacity(selectedTab == item.tab ? 1: 0.5)
                        .background {
                            VStack {
                                RoundedRectangle(cornerRadius: 2)
                                    .fill(Color.accentColor)
                                    .frame(width: 20, height: 4)
                                    .offset(y: -4)
                                    .opacity(selectedTab == item.tab ? 1 : 0)
                                Spacer()

                            }
                        }
                }
            }
        }
    }
}

struct TabItem: Identifiable {
    var id = UUID()
    var icon: RiveViewModel
    var tab : Tab
}

var tabItems = [
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT"), tab: .chat),
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH"), tab: .search),
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "TIMER_Interactivity", artboardName: "TIMER"), tab: .timer),
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "BELL_Interactivity", artboardName: "BELL"), tab: .bell),
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "USER_Interactivity", artboardName: "USER"), tab: .user)
]

enum Tab: String {
    case chat
    case search
    case timer
    case bell
    case user
}

#Preview {
    TabbarView()
}
