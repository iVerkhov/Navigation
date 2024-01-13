//
//  ContentView.swift
//  Navigation
//
//  Created by Игорь Верхов on 16.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    struct DetailView: View {
        var number: Int
        @Binding var path: NavigationPath
        @State private var title = "SwiftUI"
        
        var body: some View {
                NavigationLink("Go to randeom number", value: Int.random(in: 1..<100))
                    .navigationTitle($title)
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Home") {
                                path = NavigationPath()
                            }
                        }
                    }
//                    .navigationBarBackButtonHidden()
        }
    }
    
    @State var pathStrore = PathStore()
    
    var body: some View {
        NavigationStack(path: $pathStrore.path) {
            List(1..<50) { selection in
                Text("\(selection)")
            }
            DetailView(number: 0, path: $pathStrore.path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, path: $pathStrore.path)
                }
                .navigationTitle("Titles goes there")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(.green, for: .navigationBar)
                .toolbarColorScheme(.dark, for: .navigationBar)
//                .toolbar(.hidden, for: .navigationBar)
            
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("Tap me") { }
                        Button("Wow!") { }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
