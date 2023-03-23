//
//  Color.swift
//  rickandmortyapp
//
//  Created by Erick Silva on 21/03/2023.
//
import SwiftUI

extension Color {
    public static var primaryColor: Color {
        return Color(UIColor(red: 172.0/255, green: 204.0/255, blue: 222/255, alpha: 1.0))
    }
    
    public static var backgroundColor: Color {
        return Color.white
    }
    
    public static var secondaryBackgroundColor: Color {
        return Color(UIColor(red: 255.0/255, green: 248.0/255, blue: 238.0/255, alpha: 1.0))
    }
    
    public static var rickGreen: Color {
        return Color(UIColor(red: 100.0/255, green: 210.0/255, blue: 209.0/255, alpha: 1.0))
    }
}
