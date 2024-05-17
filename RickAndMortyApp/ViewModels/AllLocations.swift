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
                    
                    //MARK: Icon and link for locations
                    NavigationLink(destination: {
                        SingleLocation(location: loc)
                    }, label: {
                        IconForLocationLink(location: loc)
                    })
                }
                
                //MARK: Button for call another page locations
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
                    
                    //MARK: Call API next page
                    locations.fetchNextLocations()
                }
            }
            .navigationTitle("Locations")
        }
        .onAppear() {
            
            //MARK: Call API first page
            locations.fetchLocations()
        }
    }
}

#Preview {
    AllLocations()
//        .preferredColorScheme(.dark)
}
