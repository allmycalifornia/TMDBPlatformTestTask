//
//  FavoriteMoviesView.swift
//  TBDMPlatformTestTask
//
//  Created by Борис Кравченко on 18.09.2023.
//

//MARK: заглушка для экрана "Любимые фильмы"

import SwiftUI

struct FavoriteMoviesView: View {
    @State private var favoriteMovies: [String] = ["Властелин колец 💍", "Гарри Поттер 🪄", "Охотники за приведениями 👻", "Индиана Джонс 🤠", "Драйв 🚗"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(favoriteMovies, id: \.self) { movie in
                    NavigationLink(destination: MovieDetailScreen(movieTitle: movie)) {
                        Text(movie)
                    }
                }
                .onDelete(perform: deleteMovie)
            }
            .navigationBarTitle("Любимые фильмы", displayMode: .inline)
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func deleteMovie(at offsets: IndexSet) {
        favoriteMovies.remove(atOffsets: offsets)
    }
}

struct MovieDetailScreen: View {
    let movieTitle: String
    
    var body: some View {
        Text("Описание фильма: \(movieTitle)")
            .navigationBarTitle(movieTitle, displayMode: .inline)
    }
}

struct FavoriteMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteMoviesView()
    }
}

struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                FavoriteMoviesView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Любимые фильмы")
                    }
                Text("Другие вкладки")
                    .tabItem {
                        Image(systemName: "star.fill")
                        Text("Другие вкладки")
                    }
            }
        }
    }
}
