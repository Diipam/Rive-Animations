//
//  HomeView.swift
//  Rive Animations
//
//  Created by Smart Solar Nepal on 18/07/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView {
                content
            }
        }
    }

    var content: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Courses")
                .appFont(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)

            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(courses) { course in
                        Vcard(course: course)
                    }
                }
                .padding(20)
                .padding(.bottom, 10)
            }

            Text("Recent")
                .appFont(.title3)
                .padding(.horizontal, 20)

            VStack(spacing: 20) {
                ForEach(courseSections) { section in
                    HCard(section: section)
                }
            }
            .padding(20)
        }
    }
}

#Preview {
    HomeView()
}
