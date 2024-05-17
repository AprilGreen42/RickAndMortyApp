//
//  APIManagerForCharacter.swift
//  RickAndMortyApp
//
//  Created by Дмитрий on 08.11.2023.
//

import SwiftUI

//MARK: API for episode
class APIManagerForEpisode: ObservableObject {
    @Published var episode: Episodes = Episodes()
    @Published var nextEpisodes: Episodes = Episodes()

    //MARK: Function for get episode
    func fetchEpisode() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/episode") else { return }
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let responce = try JSONDecoder().decode(Episodes.self, from: data)
                DispatchQueue.main.async {
                    self?.episode = responce
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    //MARK: Function for get episodes at next page
    func fetchNextPage() {
        guard let nextPage = (nextEpisodes.info.next ?? nextEpisodes.info.prev) else { return }
        guard let url = URL(string: "\(nextPage)") else { return }
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let responce = try JSONDecoder().decode(Episodes.self, from: data)
                DispatchQueue.main.async {
                    self?.nextEpisodes = responce
                }
            } catch {
                print(error)
            }
        }
        task.resume()
        self.episode.results += self.nextEpisodes.results
    }
}



class APIManagerForCharacter: ObservableObject {
    @Published var allCharacters: Characters = Characters()
    @Published var next20Characters: Characters = Characters()
    
    //MARK: Function for get character
    func fetchAllCharacters() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
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
    
    //MARK: Function for get characters at next page
    func fetchNextPage() {
        guard let nextPage = next20Characters.info.next else { return }
        guard let url = URL(string: "\(nextPage)") else { return }
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let responce = try JSONDecoder().decode(Characters.self, from: data)
                DispatchQueue.main.async {
                    self?.next20Characters = responce
                }
            } catch {
                print(error)
            }
        }
        task.resume()
        self.allCharacters.results += self.next20Characters.results
    }
}


class APIManagerForLocation: ObservableObject {
    @Published var allLocation: Locations = Locations()
    @Published var next20Locations: Locations = Locations()
    
    //MARK: Function for get location
    func fetchLocations() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/location") else { return }
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let responce = try JSONDecoder().decode(Locations.self, from: data)
                DispatchQueue.main.async {
                    self?.allLocation = responce
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    //MARK: Function for get locations at next page
    func fetchNextLocations() {
        guard let nextPage = next20Locations.info.next else { return }
        guard let url = URL(string: "\(nextPage)") else { return }
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let responce = try JSONDecoder().decode(Locations.self, from: data)
                DispatchQueue.main.async {
                    self?.next20Locations = responce
                }
            } catch {
                print(error)
            }
        }
        task.resume()
        self.allLocation.results += self.next20Locations.results
    }
}
