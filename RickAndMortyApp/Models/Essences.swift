//
//  Essences.swift
//  RickAndMortyApp
//
//  Created by Дмитрий on 19.11.2023.
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
    
    struct Origin: Codable {
        var name: String
        var url: String
    }

    struct Location: Codable {
        var name: String
        var url: String
    }
}

struct InfoOfCharacter: Codable {
    var count: Int = 826
    var pages: Int = 42
    var next: String? = "https://rickandmortyapi.com/api/character/?page=2"
    var prev: String? = nil
}

struct Characters: Codable {
    var info = InfoOfCharacter()
    var results: [Character] = []
}



struct Episode: Codable, Identifiable {
    var id: Int
    var name: String
    var air_date: String
    var episode: String
    var characters: [String]
    var url: String
    var created: String
}

struct InfoOfEpisode: Codable {
    var count: Int = 51
    var pages: Int = 3
    var next: String? = "https://rickandmortyapi.com/api/episode?page=2"
    var prev: String? = nil
}

struct Episodes: Codable {
    var info = InfoOfEpisode()
    var results: [Episode] = []
}



struct Location: Identifiable, Codable {
    var id: Int
    var name: String
    var type: String
    var dimension: String
    var residents: [String]
    var url: String
    var created: String
}

struct InfoOfLocation: Codable {
    var count: Int = 126
    var pages: Int = 7
    var next: String? = "https://rickandmortyapi.com/api/location?page=2"
    var prev: String? = nil
}

struct Locations: Codable {
    var info = InfoOfLocation()
    var results: [Location] = []
}
