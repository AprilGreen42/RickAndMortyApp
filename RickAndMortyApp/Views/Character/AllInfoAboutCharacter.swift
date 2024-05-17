//
//  InfoAboutCharacter.swift
//  RickAndMortyApp
//
//  Created by Дмитрий on 08.11.2023.
//

import SwiftUI

struct InfoAboutCharacter: View {
    @State private var isLoading: Bool = true
    var character: Character
    var body: some View {
        
        //MARK: Get api and build view
        ZStack {
            
            //MARK: Progress view for smooth loading
            if self.isLoading {
                ProgressView()
            } else {
                
                //MARK: Building character view
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
                        })
                    }
                }
                .toolbarRole(.editor)
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
    AllCharacters()
        .preferredColorScheme(.dark)
}
