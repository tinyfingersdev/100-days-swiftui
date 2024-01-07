//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Shannon Paige on 1/7/24.
//

import SwiftUI


struct BlueHeaderFont: ViewModifier {
        
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
}

extension View {
    func blueHeader() -> some View {
        modifier(BlueHeaderFont())
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .blueHeader()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
