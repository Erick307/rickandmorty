//
//  Character.swift
//  rickandmortyapp
//
//  Created by Erick Silva on 21/03/2023.
//

import Foundation

struct Character : Identifiable, Codable {
    
    var id: Int
    var name: String
    var status: String
    var species:String
    var type: String
    var gender: String
    var origin: Location
    var location: Location
    var image: String
    var episode:[String]
    var url:String
    
    static var characterList = [
        Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", type: "", gender: "Male", origin: .c137, location: .c137 , image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: ["https://rickandmortyapi.com/api/episode/1","https://rickandmortyapi.com/api/episode/2"], url: ""),
        Character(id: 2, name: "Morty Smith", status: "Alive", species: "Human", type: "", gender: "Male", origin: .c137, location: .c137 , image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg", episode: ["https://rickandmortyapi.com/api/episode/1","https://rickandmortyapi.com/api/episode/2"], url: ""),
        Character(id: 3, name: "Summer Smith", status: "Alive", species: "Human", type: "", gender: "Female", origin: .c137, location: .c137 , image: "https://rickandmortyapi.com/api/character/avatar/3.jpeg", episode: ["https://rickandmortyapi.com/api/episode/1","https://rickandmortyapi.com/api/episode/2"], url: ""),
        Character(id: 4, name: "Beth Smit", status: "Alive", species: "Human", type: "", gender: "Female", origin: .c137, location: .c137 , image: "https://rickandmortyapi.com/api/character/avatar/4.jpeg", episode: ["https://rickandmortyapi.com/api/episode/1","https://rickandmortyapi.com/api/episode/2"], url: "")
    ]
    
    
    struct Location : Codable{
        var name:String
        var url: String
        static var c137 = Location(name:"Earth (C-137)",url:"https://rickandmortyapi.com/api/location/1")
    }
}


