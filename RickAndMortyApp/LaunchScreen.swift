//
//  LaunchScreen.swift
//  RickAndMortyApp
//
//  Created by Дмитрий on 08.11.2023.
//

import SwiftUI

struct LaunchScreen: View {
    var body: some View {
        ZStack {
            Image("Stars")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .padding(.horizontal, 16)
                .padding(.bottom, 72)
            VStack {
                Image("NameOfShow")
                    .resizable()
                    .frame(width: 140, height: 40)
                Image("Portal")
                    .resizable()
                    .frame(width: 140, height: 228)
                    .padding(.bottom, 80)
            }
            .padding(.bottom, 200)
            
        }
        .padding(.top, 98)
        .background(Color("ColorOfMainScreen"))
    }
}

#Preview {
    LaunchScreen()
        .background(Color("ColorOfMainScreen"))
}
