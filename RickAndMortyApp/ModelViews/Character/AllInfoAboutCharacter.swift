//
//  InfoAboutCharacter.swift
//  RickAndMortyApp
//
//  Created by Дмитрий on 08.11.2023.
//

import SwiftUI

struct InfoAboutCharacter: View {
    
    var character: Character
    var body: some View {
        NavigationStack {
            AsyncImage(url: URL(string: "\(character.image)"), scale: 1.48)
                .cornerRadius(16)
            Text(character.name)
                .font(.system(size: 22))
                .padding(.top, 10)
                .padding(.bottom, 10)
                .bold()
            Text("\(character.status)")
                .font(.system(size: 16))
                .foregroundStyle(.green)
            Form {
                Section {
                    LabeledContent("Species:", value: character.species)
                    LabeledContent("Type:", value: character.type != "" ? character.type : "None")
                    LabeledContent("Gender:", value: character.gender)
                } header: {
                    Text("Info")
                        .font(.system(size: 17))
                        .foregroundStyle(.white)
                }
                Section(content: {
                    HStack {
                        Spacer()
                        Text("\(character.origin.name)")
                        Spacer()
                    }
                }, header: {
                    Text("Origin")
                        .font(.system(size: 17))
                        .foregroundStyle(.white)
                })
                Section(content: {
//                    ForEach(character.episode.results) { ep in
//                        LabeledContent("\(ep.name):", value: ep.episode)
//                    }
                }, header: {
                    Text("Episodes")
                        .font(.system(size: 17))
                        .foregroundStyle(.white)
                })
            }
        }
        .toolbarRole(.editor)
    }
}

//#Preview {
//    InfoAboutCharacter()
//        .preferredColorScheme(.dark)
//}
