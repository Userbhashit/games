//
//  History.swift
//  games
//
//  Created by Bhashit Gautam on 16/05/25.
//

import SwiftUI
import SwiftData

struct History: View {
    
    @Environment(\.modelContext) private var context
    @Query private var gamess: [Record]
    
    var body: some View {
        VStack {
            Text("Record")
                .font(.title)
                .foregroundStyle(.primary)
                .fontWeight(.bold)
            
            List {
                HStack {
                    Text("Game").bold().frame(maxWidth: .infinity, alignment: .leading)
                    Text("Players").bold().frame(maxWidth: .infinity, alignment: .leading)
                    Text("Winner").bold().frame(maxWidth: .infinity, alignment: .leading)
                    Text("Date").bold().frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.vertical, 5)
                .background(Color.gray.opacity(0.1))
                
                ForEach(gamess) { game in
                    HStack {
                        Text(game.gameName).frame(maxWidth: .infinity, alignment: .leading)
                        Text(game.players).frame(maxWidth: .infinity, alignment: .leading)
                        Text(game.winner).frame(maxWidth: .infinity, alignment: .leading)
                        Text(game.date).frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.vertical, 2)
                }.onDelete(perform: deleteGames)
                .toolbar {
                    EditButton()
                }
            }.onAppear {
                print("Fetched records: \(gamess.count)")
            }
        }
    }
    
    func deleteGames(at offsets: IndexSet) {
         for index in offsets {
             let gameToDelete = gamess[index]
             context.delete(gameToDelete)
         }

         try? context.save()
     }
}

#Preview {
    History()
}
