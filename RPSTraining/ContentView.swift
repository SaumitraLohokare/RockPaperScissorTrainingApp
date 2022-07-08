//
//  ContentView.swift
//  RPSTraining
//
//  Created by Saumitra Lohokare on 7/8/22.
//

import SwiftUI

struct ContentView: View {
    
    let options = ["Rock", "Paper", "Scisor"]
    
    @State private var score = 0
    @State private var AIChoice = Int.random(in: 0...1)
    @State private var needToWin = Bool.random()
    
    var body: some View {
        VStack {
            Text("Score: \(score)")
                .font(.system(size: 40, weight: .medium))
                .padding()
            
            Spacer()
            
            VStack(alignment: .center) {
                Text("Choose the")
                    .font(.system(size: 52, weight: .bold))
                Text(needToWin ? "Winner" : "Loser")
                    .font(.system(size: 52, weight: .bold))
                    .foregroundColor(needToWin ? Color("Win") : Color("Lose"))
            }
            
            Image(options[AIChoice])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
            
            Spacer()
            Spacer()
            
            VStack(spacing: 80) {
                Button(action: {
                    checkChoice(choice: 0)
                }, label: {
                    Image(options[0])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                })
                
                HStack(spacing: 100) {
                    Button(action: {
                        checkChoice(choice: 1)
                    }, label: {
                        Image(options[1])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100)
                    })
                    
                    Button(action: {
                        checkChoice(choice: 2)
                    }, label: {
                        Image(options[2])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100)
                    })
                }
            }
        }
    }
    
    func resetRound() {
        AIChoice = Int.random(in: 0...2)
        needToWin = Bool.random()
    }
    
    func checkChoice(choice: Int) {
        if needToWin {
            if (AIChoice == 0 && choice == 1) ||
                (AIChoice == 1 && choice == 2) ||
                (AIChoice == 2 && choice == 0) {
                score += 1
            }
        } else {
            if (AIChoice == 0 && choice == 2) ||
                (AIChoice == 1 && choice == 0) ||
                (AIChoice == 2 && choice == 1) {
                score += 1
            }
        }
        
        
        resetRound()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
