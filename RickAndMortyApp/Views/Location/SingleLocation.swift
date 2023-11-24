//
//  SingleLocation.swift
//  RickAndMortyApp
//
//  Created by Дмитрий on 21.11.2023.
//

import SwiftUI

struct SingleLocation: View {
    @State private var isLoading: Bool = true
    var location: Location
    var body: some View {
        ZStack {
            if self.isLoading {
                ProgressView()
            } else {
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
    AllLocations()
        .preferredColorScheme(.dark)
}
