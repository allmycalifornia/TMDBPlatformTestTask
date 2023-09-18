//
//  ContentView.swift
//  TBDMPlatformTestTask
//
//  Created by Борис Кравченко on 18.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = MovieDBViewModel()
    
    var body: some View {
        VStack {
           
        }
        .padding()
        .onAppear {
            Task {
                viewModel.loadTrending()
            }
        }
    }
    
    @MainActor
    class MovieDBViewModel: ObservableObject {
        
        @Published var trending: [TrendingItem] = []
        static let apiKey = "b4e6c5a23f90bba80538cc7ea92e949c"
        static let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNGU2YzVhMjNmOTBiYmE4MDUzOGNjN2VhOTJlOTQ5YyIsInN1YiI6IjY1MDQxMTIxZTBjYTdmMDBlYzhlODZlMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BG5ACKqJp9BcQmwaE065hCUFIbF-EvoPgHylxOaa2Eg"
        
        func loadTrending() {
            Task {
                let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=\(ContentView.MovieDBViewModel.apiKey)")!
                do {
                    let (data, _) = try await URLSession.shared.data(from: url)
                    let trendingResults = try JSONDecoder().decode(TrendingResults.self, from: data)
                    trending = trendingResults.results
                } catch {
                    print(error.localizedDescription)
                    
                }
                
            }
        }
        
    }
    
    struct TrendingResults: Decodable {
        let page: String
        let results: [TrendingItem]
        let total_pages: Int
        let total_results: Int
    }
    
    struct TrendingItem: Identifiable, Decodable {
        
        let adult: Bool
        let id: Int
        let poster_path: String
        let title: String
        let vote_average: Float
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
