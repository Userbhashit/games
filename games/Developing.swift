//
//  SwiftUIView.swift
//  games
//
//  Created by Bhashit Gautam on 09/05/25.
//

import SwiftUI

struct SwiftUIView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        if (colorScheme != .dark){
            Text("")
            
            Text("Welcome")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                
            Text("Please use Dark mode.")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("Light mode not supported.")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
    }
}

#Preview {
    SwiftUIView()
}
