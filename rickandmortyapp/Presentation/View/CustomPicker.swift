//
//  CustomPicker.swift
//  rickandmortyapp
//
//  Created by Erick Silva on 21/03/2023.
//

import SwiftUI

struct CustomPicker: View {
    
    @Binding var selected : Int
    let items : [String]
    
    var body: some View {
        HStack{
            ForEach(items.indices, id: \.self) { index in
                Text(items[index])
                    .padding()
                    .frame(height: 40)
                    .background{
                        index == selected ? Color.rickGreen : Color(white: 0.9)
                    }
                    .foregroundColor(index == selected ? Color.white : Color.init(white: 0.5))
                    .cornerRadius(20)
                    .onTapGesture {
                        selected = index
                    }
            }.frame(height: 40)
        }
    }
}

struct CustomPicker_Previews: PreviewProvider {
    static var categories = ["All","Alive", "Dead","Unknown"]
    @State static var categorySelected: Int = 0
    
    static var previews: some View {
        CustomPicker(selected: $categorySelected, items: categories)
    }
}
