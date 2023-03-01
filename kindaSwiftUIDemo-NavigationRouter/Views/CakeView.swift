//
//  CakeView.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 22.02.2023.
//

import SwiftUI
import kindaSwiftUI

struct CakeView: View {
    
    @EnvironmentObject private var router: Router<Destination>
    
    @State private var didPresentDeepLink = false
    
    var body: some View {
        List {
            Section {
                Button("Push 🍩") {
                    router.push(.doughnutView)
                }
            } header: {
                Text("Push")
            }
        }
        .navigationTitle("🎂")
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                deepLink()
            })
        }
    }
    
    func deepLink() {
        guard !didPresentDeepLink else { return }
        log(.debug, type: .developer, "Presenting deep link")
        Task {
            await router.push(.doughnutView)
            await router.push(.junkFoodView(dependency: "🍕"))
            await router.push(.chocolateView)
            #if os(iOS) || os(macOS)
            await router.present(.honeyViewSheet)
            #elseif os(watchOS)
            await router.present(.honeyViewFullScreenCover)
            #elseif os(tvOS)
            await router.push(.honeyViewSheet)
            #endif
            didPresentDeepLink.toggle()
        }
    }
}

