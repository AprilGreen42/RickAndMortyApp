//
//  AllCharacters.swift
//  RickAndMortyApp
//
//  Created by Дмитрий on 08.11.2023.
//

import SwiftUI

struct AllCharacters: View {
    
    @StateObject var allCharacter = APIManager()
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
                
                Button(action: {
                    allCharacter.fetchNextPage()
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
                    allCharacter.fetchAllCharacters()
                }
                .onDisappear() {
                    allCharacter.rem()
                }
            }
            .navigationTitle("Charcters")
            .padding(.top)
        }
        .ignoresSafeArea(.all)
    }

}

#Preview {
    AllCharacters()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
