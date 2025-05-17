//
//  Record.swift
//  games
//
//  Created by Bhashit Gautam on 14/05/25.
//

import Foundation
import SwiftData

@Model
class Record: Identifiable {
    
    var gameName: String
    var players: String
    var winner: String
    var date: String
    
    init(_ gameName: String, _ players: String, _ winner: String, _ date: String) {
        self.gameName = gameName
        self.players = players
        self.winner = winner
        self.date = date
    }
}

