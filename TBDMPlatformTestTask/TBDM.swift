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
                MovieListView()
                    .tabItem {
                        Image(systemName: "popcorn.circle")
                        Text("Популярное")
                    }
                FavoriteMoviesView()
                    .tabItem {
                        Image(systemName: "heart.circle")
                        Text("Избранное")
                    }
                Text("Сейчас в кинотеатрах:")
                    .tabItem {
                        Image(systemName: "film.circle")
                        Text("Купить билеты")
                    }
                UserProfileView()
                    .tabItem {
                        Image(systemName: "person.circle")
                        Text("Профиль")
                    }
            }
        }
    }
}

