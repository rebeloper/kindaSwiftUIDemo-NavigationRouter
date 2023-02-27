//
//  HoneyView.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 22.02.2023.
//

import SwiftUI
import kindaSwiftUI

struct HoneyView: View {
    
    @EnvironmentObject var router: Router<Destination>
    
    var body: some View {
        List {
            Button("Push 🍪") {
                router.push(.cookieView)
            }
            
            Button("Pop") {
                router.pop()
            }
            
            Button("Pop the last 2") {
                router.pop(.the(last: 2))
            }
            
            Button("Pop to root") {
                router.pop(.toRoot)
            }
            
            #if os(iOS) || os(macOS)
            Button("Present 🍦 sheet") {
                router.present(.iceCreamViewSheet)
            }
            #endif
        }
        .navigationTitle("🍯")
        #if os(iOS) || os(macOS)
        .sheet(for: Destination.iceCreamViewSheet, presentationDetents: [.fraction(0.4)])
        #endif
    }
}

