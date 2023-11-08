//
//  AllCharacters.swift
//  RickAndMortyApp
//
//  Created by Дмитрий on 08.11.2023.
//

import SwiftUI

struct AllCharacters: View {
    
    @StateObject var allCharacter = APIManager()
    @State private var idForCharacter: Int = 0
    
    var body: some View {
            NavigationStack {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(allCharacter.allCharacters.results) { char in
                        NavigationLink(destination: {
                            InfoAboutCharacter(idCharacter: "\(char.id)")
                        }, label: {
                            IconOfCharacter(idCharacter: "\(char.id)")
                        })
                    }
                    .onAppear() {
                        allCharacter.fetchAllCharacters()
                    }
                    .onDisappear() {
                        allCharacter.rem()
                    }
                }
                .navigationTitle("Charcters")
            }
            .ignoresSafeArea(.all)
    }
}

#Preview {
    AllCharacters()
}
