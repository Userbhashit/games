//
//  TicTacToe .swift
//  games
//
//  Created by Bhashit Gautam on 08/05/25.
//

import SwiftUI

struct TicTacToe: View {
    
    @State private var board = [["", "", ""], ["", "", ""], ["", "", ""]]
    @State private var currentPlayer = "X"
    @State private var gameRunning = true
    @State private var winner = ""
    
    var body: some View {
        VStack {
            Text(gameRunning ? "Current player: \(currentPlayer)" : "Winner: \(winner)")
                .font(.title)
                .padding()
            
            ForEach(0..<3, id: \.self) { row in
                HStack {
                    ForEach(0..<3, id: \.self) { col in
                        Button(action: {
                            if gameRunning {
                                makeMove(row: row, col: col)
                                if gameOver(board: board) {
                                    gameRunning = false
                                } else {
                                    currentPlayer = currentPlayer == "X" ? "O" : "X"
                                }
                            }
                        }) {
                            Text(board[row][col])
                                .font(.largeTitle)
                                .frame(width: 100, height: 100)
                                .background(Color.gray)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                        
                        
                    }
                }
            }
            
            Button(action: {
                resetBoard()
            }) {
                Text("Reset")
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.blue)
                    .font(.system(size: 50, weight: .medium))
            }.padding()
        }.padding()
    }
    
    func makeMove(row: Int, col: Int) {
        if board[row][col] == "" {
            board[row][col] = currentPlayer
        }
    }
    
    func gameOver(board: [[String]]) -> Bool {
        let flatBoard = board.flatMap { $0 }
        
        let winConditions = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8],
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8],
            [0, 4, 8],
            [2, 4, 6]
        ]
        
        for condition in winConditions {
            let first = flatBoard[condition[0]]
            if first != "" && condition.allSatisfy({ flatBoard[$0] == first }) {
                winner = first
                return true
            }
        }
        
        if !flatBoard.contains("") {
            winner = "Draw"
            return true
        }
        
        return false
    }
    
    func resetBoard() {
        board = [["", "", ""],
                 ["", "", ""],
                 ["", "", ""]]
        
        winner = ""
        gameRunning = true
        currentPlayer = "X"
    }
}

#Preview {
    TicTacToe_()
}
