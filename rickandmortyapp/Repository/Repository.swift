//
//  Repository.swift
//  rickandmortyapp
//
//  Created by Erick Silva on 22/03/2023.
//

import Foundation

protocol IRepository {
    
    func search(name:String, status:String?) async -> Result<Characters, Error>
    func getCharacters(page:Int, status:String?) async -> Result<Characters, Error>
}

enum APIError: Error {
    case badRequest
    case serverError
    case unknown
}

struct Repository : IRepository {
    
    func search(name:String, status:String?) async -> Result<Characters, Error> {
        guard var components = URLComponents(string: "https://rickandmortyapi.com/api/character") else{
            return .failure(APIError.badRequest)
        }
        var items = [URLQueryItem(name: "name", value: name)]
        if let s = status {
            items.append(URLQueryItem(name: "status", value: s))
        }
        components.queryItems = items
        let request = URLRequest(url: components.url!)
        
        do{
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            let characters = try decoder.decode(Characters.self, from: data)
            return .success(characters)
        }catch{
            return .failure(APIError.unknown)
        }
    }
    
    func getCharacters(page:Int, status:String?) async -> Result<Characters, Error> {
        guard var components = URLComponents(string: "https://rickandmortyapi.com/api/character") else{
            return .failure(APIError.badRequest)
        }
        var items = [URLQueryItem(name: "page", value: "\(page)")]
        if let s = status {
            items.append(URLQueryItem(name: "status", value: s))
        }
        components.queryItems = items
        let request = URLRequest(url: components.url!)
        
        do{
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            let characters = try decoder.decode(Characters.self, from: data)
            return .success(characters)
        }catch{
            return .failure(APIError.unknown)
        }
    }
    
}
