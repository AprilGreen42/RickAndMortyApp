//
//  APIManager.swift
//  RickAndMortyApp
//
//  Created by Дмитрий on 08.11.2023.
//

import SwiftUI


struct Character: Identifiable, Codable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var location: Location
    var image: String
    var url: String
    var created: String
    var gender: String
    var origin: Origin
    var episode: [String]
}

struct Origin: Codable {
    var name: String
    var url: String
}

struct Location: Codable {
    var name: String
    var url: String
}

struct Characters: Codable {
    var results: [Character] = []
}


class APIManager: ObservableObject {
    @Published var character: Characters = Characters()
    @Published var allCharacters: Characters = Characters()
    let baseURL: String = "https://rickandmortyapi.com/api/character"
    
    func fetchAllCharacters() {
        guard let url = URL(string: baseURL) else { return }
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let responce = try JSONDecoder().decode(Characters.self, from: data)
                DispatchQueue.main.async {
                    self?.allCharacters = responce
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func rem() {
        self.allCharacters.results.removeAll()
    }
    
    func fetchByID(meth: String) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/" + meth) else { return }
        
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let resp = try JSONDecoder().decode(Character.self, from: data)
                DispatchQueue.main.async {
                    self?.character.results.append(resp)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}

