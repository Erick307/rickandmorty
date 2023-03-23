//
//  CharactersList.swift
//  rickandmortyapp
//
//  Created by Erick Silva on 22/03/2023.
//

import Foundation
import SwiftUI

struct InfiniteList : View {
    
    @ObservedObject var viewModel : DashboardViewModel
    
    var body: some View {
        Section{
            ForEach(viewModel.all) { character in
                ZStack{
                    ResultItem(character: character).padding(.vertical,10)
                    NavigationLink{
                        DetailView(character: character)
                    } label:{
                        EmptyView()
                    }.opacity(0.0)
                }
            }
            HStack{
                Spacer()
                Text("Loading more...")
                Spacer()
            }.onAppear{
                getMore()
            }
            
        } header: {
            Text("Characters").font(.title2).bold().foregroundColor(.black).padding()
        }
        .listRowInsets(EdgeInsets())
        .listRowSeparator(.hidden)
    }
    
    func getMore() {
        Task{
            viewModel.fetchMore()
        }
    }
}

struct Results : View {
    
    @ObservedObject var viewModel : DashboardViewModel
    
    var body: some View {
        Section{
            ForEach(viewModel.results) { character in
                ZStack{
                    ResultItem(character: character).padding(.vertical,10)
                    NavigationLink{
                        DetailView(character: character)
                    } label:{
                        EmptyView()
                    }.opacity(0.0)
                }
            }
        } header: {
            Text("Characters").font(.title2).bold().foregroundColor(.black).padding()
        }
        .listRowInsets(EdgeInsets())
        .listRowSeparator(.hidden)
    }
}

struct ResultItem: View {
    
    var character: Character
    
    var body: some View{
        HStack{
            ImageCache(character.image)
                .frame(maxWidth: 90, maxHeight: 90)
                .cornerRadius(10)
                .padding(5)
            VStack(alignment:.leading){
                Text(character.name).font(.headline).lineLimit(2)
                Text("Location: \(character.location.name)")
                    .font(.subheadline).lineLimit(2)
                Text("Species: \(character.species)")
                    .font(.subheadline).lineLimit(2)
            }
            Spacer()
        }.background{
            Color.secondaryBackgroundColor
        }
        .cornerRadius(10)
        .shadow(color: .init(white: 0.9), radius: 2, x: 0, y: 2)
        .padding(.horizontal)
    }
}
