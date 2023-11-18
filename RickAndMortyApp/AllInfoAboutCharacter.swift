//
//  InfoAboutCharacter.swift
//  RickAndMortyApp
//
//  Created by Дмитрий on 08.11.2023.
//

import SwiftUI

struct InfoAboutCharacter: View {
    
    @StateObject var character = APIManager()
    var idCharacter: String = "1"
    @State var type: String = ""
    var body: some View {
        NavigationStack {
            ForEach(character.character.results) { char in
                AsyncImage(url: URL(string: "\(char.image)"), scale: 1.48)
                    .cornerRadius(16)
                Text(char.name)
                    .font(.system(size: 22))
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .bold()
                Text("\(char.status)")
                    .font(.system(size: 16))
                    .foregroundStyle(.green)
                Form {
                    Section {
                        LabeledContent("Species:", value: char.species)
                        LabeledContent("Type:", value: char.type != "" ? char.type : "None")
                        LabeledContent("Gender:", value: char.gender)
                    } header: {
                        Text("Info")
                            .font(.system(size: 17))
                            .foregroundStyle(.white)
                    }
                    Section(content: {
                        HStack {
                            Spacer()
                            Text("\(char.origin.name)")
                            Spacer()
                        }
                    }, header: {
                        Text("Origin")
                            .font(.system(size: 17))
                            .foregroundStyle(.white)
                    })
                    Section(content: {
                        
                    }, header: {
                        Text("Episodes")
                            .font(.system(size: 17))
                            .foregroundStyle(.white)
                    })
                }
            }
        }
        .toolbarRole(.editor)
        .onAppear {
            character.fetchByID(meth: idCharacter)
        }
    }
}

#Preview {
    InfoAboutCharacter()
        .preferredColorScheme(.dark)
}
