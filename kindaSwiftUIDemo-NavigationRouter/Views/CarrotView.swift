//
//  CarrotView.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 22.02.2023.
//

import SwiftUI
import kindaSwiftUI

struct CarrotView: View {
    
    @EnvironmentObject var router: Router<Destination>
    
    var body: some View {
        List {
            Button("Push 🥝") {
                router.push(.kiwiView)
            }
            
#if os(iOS) || os(watchOS)
            Button("Present 🍯 full screen cover") {
                router.present(.honeyViewFullScreenCover)
            }
#endif
        }
        .navigationTitle("🥕")
#if os(iOS) || os(watchOS)
        .fullScreenCover(for: Destination.honeyViewFullScreenCover)
#endif
    }
}

