//
//  DoughnutView.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 22.02.2023.
//

import SwiftUI
import kindaSwiftUI

struct DoughnutView: View {
    
    @EnvironmentObject var router: Router<Destination>
    
    var body: some View {
        List {
            Button("Push 🌭") {
                router.push(.junkFoodView(title: "🌭"))
            }
            
            Button("Pop") {
                router.pop()
            }
        }
        .navigationTitle("🍩")
    }
}

