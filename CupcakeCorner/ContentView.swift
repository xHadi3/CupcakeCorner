//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Hadi Al zayer on 10/08/1446 AH.
//

import SwiftUI



struct ContentView: View {
  @State private var counter = 0
    
    var body: some View {
        Button("Tap Count \(counter)"){
            counter += 1
        }
        .sensoryFeedback(.increase, trigger: counter)
    }
}

#Preview {
    ContentView()
}
