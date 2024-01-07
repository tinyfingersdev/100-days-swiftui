//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Shannon Paige on 1/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var showingGameEnd = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var score = 0
    @State private var questionNumber = 1
    
    
    struct FlagImage: View {
        var flag: String
        var body: some View {
            Image(flag)
                .clipShape(.capsule)
                .shadow(radius: 5)
        }
    }
    
    
    var body: some View {
        ZStack {
            
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack (spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagtapped(number)
                        } label:{
                            FlagImage(flag: countries[number])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(scoreMessage)
        }
        .alert("Game completed!", isPresented: $showingGameEnd) {
            Button("New Game", action: resetGame)
        } message: {
            Text("Your final score is \(score)")
        }
    }
    
    func flagtapped(_ number: Int) {
        if number == correctAnswer {
            addScore(for: 1)
            scoreTitle = "Correct"
            scoreMessage = "Congratulations! \nCurrent score is: \(score)"

        } else {
            subtractScore(for: 1)
            scoreTitle = "Wrong!"
            scoreMessage = "Thats the flag for \(countries[number]). \nCurrent score is: \(score)"

        }
        
        incrementQuestion()
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func addScore(for number: Int){
        score += 1
    }
    
    func subtractScore(for number: Int){
        if (score - number) < 0 {
            score = 0
        } else {
            score -= 1
        }
        
    }
    
    func incrementQuestion() {
        questionNumber += 1
        
        if questionNumber > 8 {
            showingGameEnd = true
        }
    }
    
    func resetGame() {
        questionNumber = 1
        score = 0
        scoreTitle = ""
        scoreMessage = ""
        showingScore = false
        showingGameEnd = false
    }
}

#Preview {
    ContentView()
}
