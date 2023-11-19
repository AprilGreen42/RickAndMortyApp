//
//  TabViewView.swift
//  RickAndMortyApp
//
//  Created by Дмитрий on 18.11.2023.
//

import SwiftUI

struct TabViewView: View {
    @State private var selection: Int = 3
    var body: some View {
        TabView(selection: $selection) {
            AllCharacters()
                .tabItem {
                    Label("Characters", systemImage: "person.3.sequence.fill")
                }
                .tag(1)
            AllLocations()
                .tabItem {
                    Label("Locations", systemImage: "globe")
                }
                .tag(2)
            AllEpisodes()
                .tabItem {
                    Label("Episodes", systemImage: "play.rectangle")
                }
                .tag(3)
        }
    }
}

#Preview {
    TabViewView()
}
