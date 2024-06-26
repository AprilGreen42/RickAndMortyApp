//
//  ContentView.swift
//  RickAndMortyApp
//
//  Created by Дмитрий on 08.11.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive: Bool = true
    var body: some View {
        ZStack {
            
            //MARK: Call launch screen, then call main view
            if self.isActive {
                LaunchScreen()
            }
            else {
                TabViewView()
            }
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
