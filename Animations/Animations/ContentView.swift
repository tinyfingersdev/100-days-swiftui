//
//  ContentView.swift
//  Animations
//
//  Created by Shannon Paige on 1/21/24.
//

import SwiftUI

struct ContentView: View {
    
    //@State private var animationAmount = 0.0
    
    @State private var dragAmount = CGSize.zero
    var body: some View {
        
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(DragGesture()
                .onChanged { dragAmount = $0.translation}
                .onEnded {_ in
                    withAnimation(.bouncy) {
                        dragAmount = .zero
                    }
                }
            )
            //.animation(.bouncy, value: dragAmount)
        
        //rotate on axis
//        Button("Tap Me"){
//            withAnimation(.spring(duration: 1)) {
//                animationAmount += 360
//            }
//            
//        }
//        .padding(50)
//        .background(.red)
//        .foregroundStyle(.white)
//        .clipShape(.circle)
//        .rotation3DEffect(
//            .degrees(animationAmount), axis: (x: 1.0, y: 1.0, z: 0.0)
//        )
        
//        print(animationAmount)
//        
//        return VStack {
//            Stepper("Scale Amount", value: $animationAmount.animation(
//                .easeInOut(duration: 1)
//                . repeatCount(3, autoreverses: true)
//            ), in: 1...10)
//            Spacer()
//            
//            Button("Tap Me") {
//                animationAmount += 1
//            }
//            .padding(40)
//            .background(.red)
//            .foregroundStyle(.white)
//            .clipShape(.circle)
//            .scaleEffect(animationAmount)
//        }
        
        //        Button("Tap me"){
        //        }
        //            .padding(50)
        //            .background(.red)
        //            .foregroundStyle(.white)
        //            .clipShape(.circle)
        //            .overlay(
        //                Circle()
        //                    .stroke(.red)
        //                    .scaleEffect(animationAmount)
        //                    .opacity(2 - animationAmount)
        //                    .animation(.easeInOut(duration: 1)
        //                        .repeatForever(autoreverses: false),
        //                               value: animationAmount)
        //            )
        //            .onAppear{
        //                animationAmount = 2
        //            }
        //    }
    }
}

#Preview {
    ContentView()
}
