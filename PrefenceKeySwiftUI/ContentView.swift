//
//  ContentView.swift
//  PrefenceKeySwiftUI
//
//  Created by Erdem on 29.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var mainTitle = "Deneme Title"
    
    var body: some View {
        
        NavigationStack {
            VStack {
                SecondScreenView(title: mainTitle)
                    .customTitlePreference("Deprecated Again")
            }

        }
        .onPreferenceChange(CustomTitlePrefenceKey.self, perform: { value in
            mainTitle = value
        })
      
        
    }
}

extension SecondScreenView {
    
    func customTitlePreference(_ title: String) -> some View {
        preference(key: CustomTitlePrefenceKey.self, value: title)
    }
}

// 1: PreferenceKey tanımlamak
// 2: Preference'ı preference fonksiyonu ile doğru instance a yönlendirmek
// 3: Seçilen Preference' ı takip, izlemek

struct CustomTitlePrefenceKey: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
    
}

struct SecondScreenView: View {
    
    let title: String
    
    var body: some View {
        
        Text(title)
    }
}

#Preview {
    ContentView()
}
