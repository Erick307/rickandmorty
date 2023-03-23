//
//  FavoritesView.swift
//  rickandmortyapp
//
//  Created by Erick Silva on 22/03/2023.
//

import SwiftUI


struct FavoritesView : View {
    
    var favorites:[Character] = []
    
    var body: some View {
        Section {
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing: 20){
                    ForEach(favorites) { favorite in
                        NavigationLink{
                            DetailView(character: favorite)
                        } label:{
                            Favorite(character: favorite)
                                .padding(.horizontal,0)
                        }
                    }
                }.padding(.horizontal).padding(.vertical,5)
            }
        } header: {
            Text("Favorites").font(.title2).bold().foregroundColor(.black).padding()
        }
        .listRowInsets(EdgeInsets())
        .listRowSeparator(.hidden)
    }
}

struct Favorite : View {
    
    var character : Character
    
    var body: some View{
        VStack(spacing: 5){
            ImageCache(character.image)
                .frame(maxWidth: 90, maxHeight: 90)
                .cornerRadius(10)
            Text(character.name).lineLimit(1).font(.caption).foregroundColor(Color.black)
        }.frame(width: 90).padding(10).cornerRadius(5).background{
            Color.primaryColor
        }.cornerRadius(10).shadow(color: .init(white: 0.8), radius: 2, x: 0, y: 2)
    }
}
struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
