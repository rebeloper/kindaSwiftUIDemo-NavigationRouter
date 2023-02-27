//
//  ChocolateView.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 22.02.2023.
//

import SwiftUI
import kindaSwiftUI

struct ChocolateView: View {
    
    @EnvironmentObject var router: Router<Destination>
    
    var body: some View {
        List {
            Button("Pop") {
                router.pop()
            }
            
            Button("Pop the last 2") {
                router.pop(.the(last: 2))
            }
            
            Button("Pop to index 1") {
                router.pop(.to(index: 1))
            }
            
            Button("Pop to root") {
                router.pop(.toRoot)
            }
            
            #if os(iOS) || os(macOS)
            Button("Present 🍯 sheet") {
                router.present(.honeyViewSheet)
            }
            #endif
            
//            #if os(iOS) || os(watchOS)
//            Button("Present 🍯 full screen cover") {
//                router.present(.honeyViewFullScreenCover)
//            }
//            #endif
            
        }
        .navigationTitle("🍫")
        #if os(iOS) || os(macOS)
        .sheet(for: Destination.honeyViewSheet, presentationDetents: [.medium], presentationDragIndicatorVisibility: .visible) {
            print("🍯 sheet dismissed")
        }
        #endif
//        #if os(iOS) || os(watchOS)
//        .fullScreenCover(for: Destination.honeyViewFullScreenCover)
//        #endif
    }
}

