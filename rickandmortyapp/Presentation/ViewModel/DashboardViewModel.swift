//
//  MainViewModel.swift
//  rickandmortyapp
//
//  Created by Erick Silva on 21/03/2023.
//

import Foundation

class DashboardViewModel : ObservableObject {

    init(repo: IRepository)  {
        self.repository = repo
    }
    
    var repository : IRepository
    var categories = ["All","Alive", "Dead","Unknown"]
    
    @Published var all : [Character] = []
    @Published var results : [Character] = []
    @Published var error: String?
    
    var nextPage = 1
    var categoryIndex: Int = 0 {
        didSet {
            changeCategory()
        }
    }
    
    var category : String? {
        categoryIndex == 0 ? nil : categories[categoryIndex]
    }
    var search: String = "" {
        didSet {
            results = []
            if search.count > 2 {
                searchCharacters()
            }
        }
    }
    var isSearching : Bool  {
        search != ""
    }
    
    func searchCharacters()  {
        Task {
            let response =  await repository.search(name: search, status: category)
            DispatchQueue.main.async{ [weak self] in
                switch response {
                case .success(let data):
                    self?.results = data.results
                case .failure(_):
                    break
                }
            }
        }
    }
    
    func changeCategory() {
        results = []
        all = []
        nextPage = 1
        
        if isSearching{
           searchCharacters()
        }
    }
    
    func fetchMore() {
        Task {
            if !isSearching {
                let response =  await repository.getCharacters(page: nextPage, status: category)
                DispatchQueue.main.async{ [weak self] in
                    switch response {
                    case .success(let data):
                        self?.all.append(contentsOf: data.results)
                    case .failure(_):
                        break
                    }
                    self?.nextPage += 1
                }
            }
        }
    }
}
