//
//  IconForSingleEpisode.swift
//  RickAndMortyApp
//
//  Created by Дмитрий on 19.11.2023.
//

import SwiftUI

struct IconForSingleEpisode: View {
    var icon: Episode
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 370, height: 100)
                .foregroundColor(Color("ColorOfCharacterCard"))
                .cornerRadius(15)
            HStack {
                Text("\(icon.name)")
                    .font(.system(size: 29))
                    .foregroundColor(.white)
                    .padding(.horizontal, 25)
                Spacer()
                Text(icon.episode)
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                    .padding(.horizontal, 25)

            }
        }
    }
}

#Preview {
    AllEpisodes()
        .preferredColorScheme(.dark)
}
