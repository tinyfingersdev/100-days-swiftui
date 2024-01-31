//
//  ContentView.swift
//  ChallengeThree
//
//  Created by Shannon Paige on 1/27/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showQuestions = true
    
    
    var body: some View {
        
        if (showQuestions) {
            
            VStack {
                HStack {
                    Button{
                        //choose option
                    } label: {
                        Text("1")
                    }
                    .padding(40)
                        .background(.red)
                        .foregroundStyle(.white)
                        .clipShape(.circle)
                    
                    Button{
                        //choose option
                    } label: {
                        Text("2")
                    }
                    .padding(40)
                        .background(.red)
                        .foregroundStyle(.white)
                        .clipShape(.circle)
                    
                    Button{
                        //choose option
                    } label: {
                        Text("3")
                    }.padding(40)
                        .background(.red)
                        .foregroundStyle(.white)
                        .clipShape(.circle)
                }
                .padding()
                
                HStack {
                    Button{
                        //choose option
                    } label: {
                        Text("1's")
                    }
                    Button{
                        //choose option
                    } label: {
                        Text("1's")
                    }
                    Button{
                        //choose option
                    } label: {
                        Text("1's")
                    }
                }.padding()
                
                HStack {
                    Button{
                        //choose option
                    } label: {
                        Text("1's")
                    }
                    Button{
                        //choose option
                    } label: {
                        Text("1's")
                    }
                    Button{
                        //choose option
                    } label: {
                        Text("1's")
                    }
                }.padding()
            }
            
        } else {
            
            
        }
        
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
    }
}

#Preview {
    ContentView()
}
