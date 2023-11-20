//
//  SingleLocation.swift
//  RickAndMortyApp
//
//  Created by Дмитрий on 21.11.2023.
//

import SwiftUI

struct SingleLocation: View {
    var location: Location
    var body: some View {
        NavigationStack {
            Form {
                Section(content: {
                    Text(location.type)
                }, header: {
                    Text("Type")
                        .font(.system(size: 17))
                        .foregroundStyle(.white)
                })
                Section(content: {
                    Text(location.dimension)
                }, header: {
                    Text("Dimension")
                        .font(.system(size: 17))
                        .foregroundStyle(.white)
                })
            }
            .navigationTitle("\(location.name)")
        }
    }
}

#Preview {
    AllLocations()
        .preferredColorScheme(.dark)
}
