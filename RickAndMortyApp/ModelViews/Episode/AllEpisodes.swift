//
//  AllEpisodes.swift
//  RickAndMortyApp
//
//  Created by Дмитрий on 18.11.2023.
//

import SwiftUI

struct AllEpisodes: View {
    @StateObject var episode = APIManagerForEpisode()
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators:false) {
                ForEach(episode.episode.results) { epis in
                    NavigationLink (
                        destination:
                                    SingleEpisode(episode: epis), 
                        label: {
                                    IconForSingleEpisode(icon: epis)
                    })
                }
                Button(action: {
                    episode.fetchNextPage()
                }, label: {
                    Text("Show more")
                        .font(.title)
                })
                .foregroundStyle(.white)
                .frame(width: 200, height: 100)
                .background(Color.blue)
                .buttonStyle(.borderless)
                .clipShape(.buttonBorder)
                .padding(.top)
                
                .onAppear() {
                    episode.fetchNextPage()
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
