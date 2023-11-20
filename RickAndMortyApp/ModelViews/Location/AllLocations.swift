//
//  AllLocations.swift
//  RickAndMortyApp
//
//  Created by Дмитрий on 18.11.2023.
//

import SwiftUI

struct AllLocations: View {
    @StateObject var locations = APIManagerForLocation()
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(locations.allLocation.results) { loc in
                    NavigationLink(destination: {
                        SingleLocation(location: loc)
                    }, label: {
                        IconForLocationLink(location: loc)
                    })
                }
                
                Button(action: {
                    locations.fetchNextLocations()
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
                    locations.fetchNextLocations()
                }
            }
            .navigationTitle("Locations")
        }
        .onAppear() {
            locations.fetchLocations()
        }
    }
}

#Preview {
    AllLocations()
//        .preferredColorScheme(.dark)
}
