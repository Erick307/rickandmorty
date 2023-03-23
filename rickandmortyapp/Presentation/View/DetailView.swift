//
//  DetailView.swift
//  rickandmortyapp
//
//  Created by Erick Silva on 22/03/2023.
//

import SwiftUI

struct DetailView: View {
    
    var character: Character
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading){
                ImageCache(character.image)
                    .frame(width: geometry.size.width, height: geometry.size.width)
                Text(character.name)
                    .font(.title).padding(.horizontal,30).padding(.top)
                Text("Status: \(character.status)")
                    .font(.title2).padding(.horizontal,30).padding(.top)
                Text("Specie: \(character.species)")
                    .font(.title2).padding(.horizontal,30)
                Text("Origin: \(character.origin.name)")
                    .font(.title2).padding(.horizontal,30)
                Text("Location: \(character.location.name)")
                    .font(.title2).padding(.horizontal,30)
                Spacer()
            }
            
        }.background{
            Color.secondaryBackgroundColor
        }.ignoresSafeArea()
            

    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailView(character: Character.characterList.first!)
        }
    }
}
