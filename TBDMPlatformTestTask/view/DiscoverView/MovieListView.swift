//
//  DiscoverView.swift
//  MovieLookup
//
//  Created by Борис Кравченко on 18.09.2023.
//

import SwiftUI

struct MovieListView: View {

    @StateObject var viewModel = MovieDiscoverViewModel()
    @State var searchText = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                if searchText.isEmpty {
                    if viewModel.trending.isEmpty {
                        Text("Данные не загружены.\nВключите VPN и проверьте\nсоединение с интернетом.")
                            .multilineTextAlignment(.center)
                    } else {
                        HStack {
                            Text("Популярное")
                                .font(.title)
                                .foregroundColor(.black)
                                .fontWeight(.heavy)
                            Spacer()
                        }
                        .padding(.horizontal
                        )
                        ScrollView(.vertical, showsIndicators: true) {
                            VStack {
                                ForEach(viewModel.trending) { trendingItem in
                                    NavigationLink {
                                        MovieDetailView(movie: trendingItem)
                                    } label: {
                                        TrendingCard(trendingItem: trendingItem)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                } else {
                    LazyVStack() {
                        ForEach(viewModel.searchResults) { item in
                            HStack {
                                AsyncImage(url: item.backdropURL) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 120)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 80, height: 120)
                                }
                                .clipped()
                                .cornerRadius(10)

                                VStack(alignment:.leading) {
                                    Text(item.title)
                                        .foregroundColor(.white)
                                        .font(.headline)

                                    HStack {
                                        Image(systemName: "hand.thumbsup.fill")
                                        Text(String(format: "%.1f", item.vote_average))
                                        Spacer()
                                    }
                                    .foregroundColor(.yellow)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                                }
                                Spacer()
                            }
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(20)
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .background(Color.white.ignoresSafeArea())
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) { newValue in
            if newValue.count > 2 {
                viewModel.search(term: newValue)
            }
        }
        .onAppear {
            viewModel.loadTrending()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
