//
//  CastView.swift
//  MovieLookup
//
//  Created by Борис Кравченко on 18.09.2023.
//

import Foundation
import SwiftUI

struct ActorsView: View {

    let cast: ActorsProfile

    var body: some View {
        VStack {
            AsyncImage(url: cast.photoUrl) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            } placeholder: {
                ProgressView()
                    .frame(width: 100, height: 120)
            }
            Text(cast.name)
                .lineLimit(0)
                .frame(width: 100)
                .foregroundColor(.black)
        }
    }

}
