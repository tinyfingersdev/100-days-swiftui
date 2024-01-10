//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Shannon Paige on 1/8/24.
//

import SwiftUI

struct ContentView: View {
    
    private var possibleMoves = ["Rock", "Paper", "Scissors"]
    
    @State private var appChoiceIndex = Int.random(in: 0..<3)
    @State private var shouldWin: Bool = Bool.random()
    @State private var playerScore = 0
    @State private var playerChoiceIndex = 0
    @State private var roundsPlayed = 0
    @State private var gameOver = false
    
    var body: some View {
        VStack {
            Text("Rounds Played: \(roundsPlayed)")
                .padding(10)
                .font(.title)
            Text("Your Score: \(playerScore) / 10")
                .padding(10)
                .font(.title)
            Text("Goal: \(shouldWin == true ? "Win against" : "Loose to") \(possibleMoves[appChoiceIndex])")
                .font(.title)

            VStack {
                 ForEach(0..<3) { number in
                    Button {
                        choiceTapped(for: number)
                    } label: {
                        Text(possibleMoves[number].description)
                            .padding(5)
                            .background(.blue)
                            .foregroundColor(.white)
                            .font(.title)
                            .shadow(radius: 5)
                    }
                    .alert("Game Over", isPresented: $gameOver) {
                        Button("New Game") {
                            gameReset()
                        }
                    }
                 }.padding(10)
            }.padding(20)
        }
        .padding()
    }
    
    func choiceTapped(for number: Int) {
        
        let appChoice = possibleMoves[appChoiceIndex].description
        let playerChoice = possibleMoves[number].description
        
        if shouldWin == true {
            if appChoice == "Rock" {
                if playerChoice == "Paper" {
                    playerScore += 1
                } else {
                    if playerScore - 1 >= 0 {
                        playerScore -= 1
                    }
                }
            } else if appChoice == "Paper" {
                if playerChoice == "Scissors" {
                    playerScore += 1
                } else {
                    if playerScore - 1 >= 0 {
                        playerScore -= 1
                    }
                }
            } else {
                if playerChoice == "Rock" {
                    playerScore += 1
                } else {
                    if playerScore - 1 >= 0 {
                        playerScore -= 1
                    }
                }
            }
        } else {
            if appChoice == "Rock" {
                if playerChoice == "Rock" || playerChoice == "Scissors" {
                    playerScore += 1
                } else {
                    if playerScore - 1 >= 0 {
                        playerScore -= 1
                    }
                }
            } else if appChoice == "Paper" {
                if playerChoice == "Rock" || playerChoice == "Paper" {
                    playerScore += 1
                } else {
                    if playerScore - 1 >= 0 {
                        playerScore -= 1
                    }
                }
            } else {
                if playerChoice == "Paper" || playerChoice == "Scissors" {
                    playerScore += 1
                } else {
                    if playerScore - 1 >= 0 {
                        playerScore -= 1
                    }
                }
            }
        }
        
        shouldWin = Bool.random()
        appChoiceIndex = Int.random(in: 0..<3)
        roundsPlayed += 1
        
        if roundsPlayed == 10
        {
            gameOver = true
        }
    }
    
    func gameReset() {
        roundsPlayed = 0
        shouldWin = Bool.random()
        appChoiceIndex = Int.random(in: 0..<3)
        playerScore = 0
        gameOver = false
    }
}

#Preview {
    ContentView()
}
