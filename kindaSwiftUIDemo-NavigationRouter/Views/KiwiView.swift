//
//  KiwiView.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 22.02.2023.
//

import SwiftUI
import kindaSwiftUI

struct KiwiView: View {
    
    @EnvironmentObject var router: Router<Destination>
    
    var body: some View {
        List {
            Button("Pop") {
                router.pop()
            }
            
            Button("Pop the last 10") {
                router.pop(.the(last: 10))
            }
            
            Button("Pop to index -5") {
                router.pop(.to(index: -5))
            }
            
            Button("Pop to index 10") {
                router.pop(.to(index: 10))
            }
            
            Button("Pop the last 10 (one by one)") {
                router.pop(.theLastWith(style: .oneByOne, last: 10))
            }
            
            Button("Pop to index -5 (one by one)") {
                router.pop(.toIndexWith(style: .oneByOne, index: -5))
            }
            
            Button("Pop to index 10 (one by one)") {
                router.pop(.toIndexWith(style: .oneByOne, index: 10))
            }
        }
        .navigationTitle("🥝")
        .toolbar(.hidden, for: .tabBar)
    }
}

