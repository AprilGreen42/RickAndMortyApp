//
//  SingleEpisode.swift
//  RickAndMortyApp
//
//  Created by Дмитрий on 19.11.2023.
//

import SwiftUI

struct SingleEpisode: View {
    var episode: Episode
    var body: some View {
        NavigationStack {
            Text("Air date: \(episode.air_date)")
                .font(.title)
            Text(episode.episode)
                .font(.title)
            Text(episode.created)
                .font(.title)
            ForEach(episode.characters, id: \.self) { char in
//                Text(char)
            }
            Spacer()
            
            .navigationTitle("\(episode.name)")
        }
        .toolbarRole(.editor)
    }
}

#Preview {
    AllEpisodes()
        .preferredColorScheme(.dark)
}
