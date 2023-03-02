//
//  ContentView.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 22.02.2023.
//

import SwiftUI
import kindaSwiftUI

struct ContentView: View {
    
    @StateObject private var routerDependencyLinker = RouterDependencyLinker()
    
    var body: some View {
//        RouterStack<Destination>(root: .carrotView)

        TabRouterStack<Destination, Tab>([
            .init(.carrotView, tab: .item(systemImage: "carrot", title: "Carrot")),
            .init(.cakeView, tab: .item(systemImage: "birthday.cake", title: "Cake"))
        ])
        .environmentObject(routerDependencyLinker)
        
//        CustomTabRouterStack<Destination, CustomTab, CustomUnselectedTab>([
//            .init(.carrotView, tab: .item(systemImage: "carrot", title: "Carrot"), unselectedTab: .item(systemImage: "carrot", title: "Carrot")),
//            .init(.cakeView, tab: .item(systemImage: "birthday.cake", title: "Cake"), unselectedTab: .item(systemImage: "birthday.cake", title: "Cake"))
//        ], tabSelection: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
