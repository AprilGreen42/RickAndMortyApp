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
                InfoCharacter(character: char)
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
