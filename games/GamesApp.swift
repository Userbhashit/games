//
//  gamesApp.swift
//  games
//
//  Created by Bhashit Gautam on 06/05/25.
//

import SwiftUI
import SwiftData

@main
struct gamesApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                Tab("TicTacToe", systemImage: "oar.2.crossed.circle") {
                    TicTacToe()
                }
                
                Tab("Sent", systemImage: "tray.and.arrow.up.fill") {
                    TicTacToe()
                }
                
                Tab("History", systemImage: "clock.arrow.trianglehead.counterclockwise.rotate.90") {
                    History()
                }
            }
            .modelContainer(for: Record.self)
        }
    }
}
