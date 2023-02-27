//
//  NavigationRouterSetup.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 22.02.2023.
//

import SwiftUI
import kindaSwiftUI

// MARK: - Destination

public enum Destination: RouterDestination {
    case defaultView
    
    case carrotView
    case kiwiView
    
    case cakeView
    case doughnutView
    case junkFoodView(title: String)
    case chocolateView
    case cookieView
    case popcornView
    case honeyViewSheet
    #if os(iOS) || os(watchOS)
    case honeyViewFullScreenCover
    #endif
    case iceCreamViewSheet
    
    public var modalValue: Int {
        switch self {
        case .defaultView: return -1
            
        case .carrotView: return 0
        case .kiwiView: return 1
            
        case .cakeView: return 2
        case .doughnutView: return 3
        case .junkFoodView(_): return 4
        case .chocolateView: return 5
        case .cookieView: return 6
        case .popcornView: return 7
        case .honeyViewSheet: return 8
        #if os(iOS) || os(watchOS)
        case .honeyViewFullScreenCover: return 9
        #endif
        case .iceCreamViewSheet: return 10
            
        }
    }
    
    public init?(modalValue: Int) {
        switch modalValue {
        case 0: self = .carrotView
        case 1: self = .kiwiView
            
        case 2: self = .cakeView
        case 3: self = .doughnutView
        case 4: self = .junkFoodView(title: "")
        case 5: self = .chocolateView
        case 6: self = .cookieView
        case 7: self = .popcornView
        case 8: self = .honeyViewSheet
        #if os(iOS) || os(watchOS)
        case 9: self = .honeyViewFullScreenCover
        #endif
        case 10: self = .iceCreamViewSheet
            
        default:
            self = .defaultView
        }
    }
    
    public var body: some View {
        switch self {
        case .defaultView:
            EmptyView()
            
        case .carrotView:
            CarrotView()
        case .kiwiView:
            KiwiView()
            
        case .cakeView:
            CakeView()
        case .doughnutView:
            DoughnutView()
        case .junkFoodView(let title):
            JunkFoodView(title: title)
        case .chocolateView:
            ChocolateView()
        case .cookieView:
            CookieView()
        case .popcornView:
            PopcornView()
        case .honeyViewSheet:
            HoneyView()
        #if os(iOS) || os(watchOS)
        case .honeyViewFullScreenCover:
            HoneyView()
        #endif
        case .iceCreamViewSheet:
            IceCreamView()
        }
    }
}

// MARK: - Tab

#if os(iOS) || os(watchOS)
public enum Tab: RouterTab {
    
    case item(systemImage: String, title: String)

    public var body: some View {
        switch self {
        case .item(let systemImage, let title):
            tabItem(systemImage: systemImage, title: title)
        }
    }

    @ViewBuilder
    func tabItem(systemImage: String, title: String) -> some View {
        Image(systemName: systemImage)
            .imageScale(.large)
        #if !os(watchOS)
        Text(title).bold()
        #endif
    }
}

// MARK: - CustomTab

public enum CustomTab: RouterTab {
    
    case item(systemImage: String, title: String)

    public var body: some View {
        switch self {
        case .item(let systemImage, let title):
            tabItem(systemImage: systemImage, title: title)
        }
    }

    @ViewBuilder
    func tabItem(systemImage: String, title: String) -> some View {
        HStack {
            Image(systemName: systemImage)
                .imageScale(.large)
            #if !os(watchOS)
            Text(title).bold()
            #endif
        }
        .foregroundColor(.white)
        .padding(6)
        .background(content: {
            Color.orange
                .cornerRadius(8)
        })
        .padding(6)
    }
}

// MARK: - CustomUnselectedTab

public enum CustomUnselectedTab: RouterUnselectedTab {
    
    case item(systemImage: String, title: String)

    public var body: some View {
        switch self {
        case .item(let systemImage, let title):
            tabItem(systemImage: systemImage, title: title)
        }
    }

    @ViewBuilder
    func tabItem(systemImage: String, title: String) -> some View {
        HStack {
            Image(systemName: systemImage)
                .imageScale(.large)
            #if !os(watchOS)
            Text(title)
            #endif
        }
        .foregroundColor(.gray)
        .padding(12)
    }
}
#endif
