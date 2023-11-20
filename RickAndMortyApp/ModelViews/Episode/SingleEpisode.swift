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
            Form {
                Section(content: {
                    Text(episode.air_date)
                }, header: {
                    Text("Air date")
                        .font(.system(size: 17))
                        .foregroundStyle(.white)
                })
                Section(content: {
                    Text(episode.episode)
                }, header: {
                    Text("Episode")
                        .font(.system(size: 17))
                        .foregroundStyle(.white)
                })
                Section(content: {
                    Text(episode.created)
                }, header: {
                    Text("Created")
                        .font(.system(size: 17))
                        .foregroundStyle(.white)
                })
            }
//            ForEach(episode.characters, id: \.self) { char in
//                Text(char)
//            }
            
            .navigationTitle("\(episode.name)")
        }
        .toolbarRole(.editor)
    }
}

#Preview {
    AllEpisodes()
        .preferredColorScheme(.dark)
}
