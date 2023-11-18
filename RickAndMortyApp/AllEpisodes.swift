//
//  AllEpisodes.swift
//  RickAndMortyApp
//
//  Created by Дмитрий on 18.11.2023.
//

import SwiftUI

struct AllEpisodes: View {
    @StateObject var episode = APIManager()
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators:false) {
                ForEach(episode.episode.results) { epis in
                    NavigationLink(destination:
                                    SingleEpisode(episode: epis), label: {
                        IconForSingleEpisode(icon: epis)
                            .buttonStyle(.borderedProminent)
                    })
                }
            }
            .navigationTitle("Episodes")
        }
        .onAppear {
            episode.fetchEpisode()
        }
    }
}

#Preview {
    AllEpisodes()
        .preferredColorScheme(.dark)
}
