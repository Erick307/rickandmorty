//
//  DashboardView.swift
//  rickandmortyapp
//
//  Created by Erick Silva on 21/03/2023.
//

import SwiftUI

struct DashboardView: View {
    
    var favorites = Character.characterList
    
    @StateObject var viewModel = DashboardViewModel(repo: Repository())
    @State var categorySelected: Int = 0
    
    var body: some View {
        NavigationView{
            List{
                CustomPicker(
                    selected: $viewModel.categoryIndex ,
                    items: viewModel.categories)
                    .listRowSeparator(.hidden)
                    .padding(.horizontal).padding(.top)
                    .listRowInsets(EdgeInsets())

                if viewModel.isSearching{
                    Results(viewModel: viewModel)
                }else{
                    FavoritesView(favorites: favorites)
                    InfiniteList(viewModel: viewModel)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Rick and Morty")
            .searchable(text: $viewModel.search)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
