//
//  TBDMPlatformTestTaskApp.swift
//  TBDMPlatformTestTask
//
//  Created by Борис Кравченко on 18.09.2023.
//

import SwiftUI

@main
struct TBDMPlatformTestTaskApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                DiscoverView()
                    .tabItem {
                        Image(systemName: "popcorn.circle")
                        Text("Trending")
                    }
                Text("Favourites movies")
                    .tabItem {
                        Image(systemName: "heart.circle")
                        Text("Favourites")
                    }
                Text("tickets")
                    .tabItem {
                        Image(systemName: "film.circle")
                        Text("Buy tickets")
                    }
            }
        }
    }
}
