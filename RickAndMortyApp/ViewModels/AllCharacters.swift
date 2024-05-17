//
//  AllCharacters.swift
//  RickAndMortyApp
//
//  Created by Дмитрий on 08.11.2023.
//

import SwiftUI

struct AllCharacters: View {
    
    @StateObject var allCharacter = APIManagerForCharacter()
    var body: some View {
                NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(allCharacter.allCharacters.results) { char in
                    
                    //MARK: Icon and link for character
                    NavigationLink(destination: {
                        InfoAboutCharacter(character: char)
                    }, label: {
                        IconOfCharacter(character: char)
                    })
                }
                
                //MARK: Button for call another page characters
                Button(action: {
                    allCharacter.fetchNextPage()
                }, label: {
                    Text("Show more")
                        .font(.title)
                })
                    .foregroundStyle(.white)
                    .frame(width: 200, height: 100)
                    .background(Color.blue)
                    .buttonStyle(.borderless)
                    .clipShape(.buttonBorder)
                    .padding(.top)
                
                .onAppear() {
                    
                    //MARK: Call API next page
                    allCharacter.fetchNextPage()
                }
            }
            .navigationTitle("Charcters")
            .padding(.top)
        }
        .onAppear() {
            
            //MARK: Call API first page
            allCharacter.fetchAllCharacters()
        }
        .ignoresSafeArea(.all)
    }

}

#Preview {
    AllCharacters()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
