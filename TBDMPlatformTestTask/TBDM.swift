//
//  TBDMPlatformTestTaskApp.swift
//  TBDMPlatformTestTask
//
//  Created by Борис Кравченко on 18.09.2023.
//

import SwiftUI

@main
struct TBDM: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                DiscoverView()
                    .tabItem {
                        Image(systemName: "popcorn.circle")
                        Text("Популярное")
                    }
                Text("Любимые фильмы")
                    .tabItem {
                        Image(systemName: "heart.circle")
                        Text("Избранное")
                    }
                Text("Сейчас в кинотеатрах:")
                    .tabItem {
                        Image(systemName: "film.circle")
                        Text("Купить билеты")
                    }
                Text("Профиль пользователя")
                    .tabItem {
                        Image(systemName: "person.circle")
                        Text("Профиль")
                    }
            }
        }
    }
}
