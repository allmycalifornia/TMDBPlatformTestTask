//
//  TrendingResults.swift
//  MovieLookup
//
//  Created by Борис Кравченко on 18.09.2023.
//

import Foundation

struct TrendingResults: Decodable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}
