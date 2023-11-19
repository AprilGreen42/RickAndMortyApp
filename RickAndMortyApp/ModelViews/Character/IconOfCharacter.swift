//
//  IconOfCharacter.swift
//  RickAndMortyApp
//
//  Created by Дмитрий on 08.11.2023.
//

import SwiftUI

struct IconOfCharacter: View {
    
    var character: Character
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 350, height: 380)
                .foregroundColor(Color("ColorOfCharacterCard"))
                .cornerRadius(15)
            VStack {
                AsyncImage(url: URL(string: "\(character.image)"))
                    .cornerRadius(16)
                Text("\(character.name)")
                    .font(.system(size: 29))
                    .foregroundColor(.white)
                    .padding(.top, 10)
            }
        }
    }
}

//#Preview {
//    IconOfCharacter()
//        .preferredColorScheme(.dark)
//}
