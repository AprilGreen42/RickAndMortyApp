//
//  IconOfCharacter.swift
//  RickAndMortyApp
//
//  Created by Дмитрий on 08.11.2023.
//

import SwiftUI

struct IconOfCharacter: View {
    
    @StateObject var character = APIManager()
    var idCharacter: String = "1"
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 350, height: 380)
                .foregroundColor(Color("ColorOfCharacterCard"))
                .cornerRadius(15)
            VStack {
                ForEach(character.character.results) { char in
                    AsyncImage(url: URL(string: "\(char.image)"))
                        .cornerRadius(16)
                    Text("\(char.name)")
                        .font(.system(size: 29))
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    
                }
            }
        }
        .onAppear {
            character.fetchByID(meth: idCharacter)
        }

    }
}

#Preview {
    IconOfCharacter()
        .preferredColorScheme(.dark)
}
