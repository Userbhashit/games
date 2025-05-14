//
//  TicTacToe .swift
//  games
//
//  Created by Bhashit Gautam on 08/05/25.
//

import SwiftUI

struct TicTacToe: View {
    
    @State private var board = [["", "", ""], ["", "", ""], ["", "", ""]]
    
    @State private var tempX = ""
    @State private var tempO = ""
    
    @State private var showSheet: Bool = true
    
    @State private var finalX = ""
    @State private var finalO = ""
    
    @State private var currentPlayer = ""
    @State private var gameRunning = true
    @State private var winner = ""
    
    @Environment(\.colorScheme) var modee
    
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
                                    currentPlayer = currentPlayer == finalX ? finalO : finalX
                                }
                            }
                        }) {
                            Text(board[row][col])
                                .font(.largeTitle)
                                .frame(width: 100, height: 100)
                                .background(Color.gray)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }.disabled(!gameRunning || board[row][col] != "")
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
            .sheet(isPresented: $showSheet) {
                VStack {
                    Text("Enter players name: ")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Leave empty for default")
                        .font(.headline)
                    
                    TextField("X", text: $tempX)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    TextField("O", text: $tempO)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    Button("Submit") {
                        finalX = tempX.isEmpty ? "X" : tempX
                        finalO = tempO.isEmpty ? "O" : tempO
                        currentPlayer = finalX
                        showSheet = false
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
    }
    
    func makeMove(row: Int, col: Int) {
        if board[row][col] == "" {
            board[row][col] = currentPlayer == finalX ? "X" : "O"
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
                winner = first == "X" ? finalX : finalO
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
        showSheet = true
        gameRunning = true
        currentPlayer = finalX
    }

}

#Preview {
    TicTacToe()
}
