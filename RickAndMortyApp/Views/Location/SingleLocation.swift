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
        
        //MARK: Get api and build view
        ZStack {
            
            //MARK: Progress view for smooth loading
            if self.isLoading {
                ProgressView()
            } else {
                
                //MARK: Building location view
                NavigationStack {
                    Form {
                        Section(content: {
                            Text(location.type)
                        }, header: {
                            Text("Type")
                                .font(.system(size: 17))
                        })
                        Section(content: {
                            Text(location.dimension)
                        }, header: {
                            Text("Dimension")
                                .font(.system(size: 17))
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
}
