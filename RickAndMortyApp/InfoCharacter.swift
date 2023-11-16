//
//  InfoCharacter.swift
//  RickAndMortyApp
//
//  Created by Дмитрий on 16.11.2023.
//

import SwiftUI

struct InfoCharacter: View {
    var character: Character
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "\(self.character.image)"), scale: 1.48)
                .cornerRadius(16)
            Text(self.character.name)
                .font(.system(size: 22))
                .padding(.top, 10)
                .padding(.bottom, 10)
                .bold()
            Text("\(self.character.status)")
                .font(.system(size: 16))
                .foregroundStyle(.green)
            Form {
                Section {
                    LabeledContent("Species:", value: self.character.species)
                    LabeledContent("Type:", value: self.character.type != "" ? self.character.type : "None")
                    LabeledContent("Gender:", value: self.character.gender)
                } header: {
                    Text("Info")
                        .font(.system(size: 17))
                        .foregroundStyle(.white)
                }
                
            }
        }
    }
}

//#Preview {
//    InfoCharacter()
//}
