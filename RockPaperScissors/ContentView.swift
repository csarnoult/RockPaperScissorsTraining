//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Chris Arnoult on 12/9/19.
//  Copyright © 2019 Chris Arnoult. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var appCurrentChoice = Int.random(in: 0...2)
    @State private var playerChoice = ""
    let RPS = ["Rock", "Paper", "Scissors"]
    @State private var shouldWin = Bool.random()
    @State private var playersScore = 0
    @State private var scoreTitle = ""
    @State private var winningChoice: Int?
    
    var body: some View {
        NavigationView {
            VStack {
                Text("If I choose \"\(RPS[appCurrentChoice])\"")
                .font(.title)
                    Text("And you want to \(String(shouldWin))")
                    .foregroundColor(.gray)
                Divider()
                    .padding()
                VStack {
                    Text("What would be your choice?")
                        .font(.headline)
                        .padding(.bottom)
                    HStack(spacing: 30) {
                        ForEach(0 ..< RPS.count) {
                            number in Button(action: {
                                self.buttonTapped(number)
                            }) {
                                Text(self.RPS[number])
                            }
                        }
                    }
                }
                Section {
                    Text("\(scoreTitle) Player's score: \(playersScore)")
                }
            }
            .navigationBarTitle(Text("RPS Training"))
        }
    }
    
    func buttonTapped(_ number: Int) {
        if shouldWin == true {
            winningChoice = appCurrentChoice + 1
            if winningChoice! > 2 {
                winningChoice = 0
            }
        }
        if shouldWin == false {
            winningChoice = appCurrentChoice - 1
            if winningChoice! <= 0 {
                winningChoice = 2
            }
        }
        if number < winningChoice! {
            print("You lose")
            scoreTitle = "Wrong..."
            playersScore -= 1
        } else {
            print("you win.")
            scoreTitle = "Correct!"
            playersScore += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
