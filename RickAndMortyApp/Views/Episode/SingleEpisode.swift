//
//  SingleEpisode.swift
//  RickAndMortyApp
//
//  Created by Дмитрий on 19.11.2023.
//

import SwiftUI

struct SingleEpisode: View {
    var episode: Episode
    @State private var isLoading: Bool = true
    var body: some View {
        ZStack {
            if isLoading {
                ProgressView()
            }
            else {
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
                    .navigationTitle("\(episode.name)")
                }
                .toolbarRole(.editor)
            }
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    isLoading = false
                }
            }
        }
    }
}

#Preview {
    AllEpisodes()
        .preferredColorScheme(.dark)
}
