//
//  IconForLocationLink.swift
//  RickAndMortyApp
//
//  Created by Дмитрий on 21.11.2023.
//

import SwiftUI

struct IconForLocationLink: View {
    var location: Location
    var body: some View {
        
        //MARK: Icon for single location
        ZStack {
            Rectangle()
                .frame(width: 370, height: 100)
                .foregroundColor(Color("ColorOfCharacterCard"))
                .cornerRadius(15)
            HStack {
                Text("\(location.name)")
                    .font(.system(size: 29))
                    .foregroundColor(.white)
                    .padding(.horizontal, 25)
            }
        }

    }
}

//#Preview {
//    IconForLocationLink()
//}
