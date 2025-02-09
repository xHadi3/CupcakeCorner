//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Hadi Al zayer on 10/08/1446 AH.
//

import SwiftUI


struct Response: Codable{
    var results: [Result]
}

struct Result: Codable{
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ContentView: View {
    @State private var results = [Result]()
    var body: some View {
        List(results, id: \.trackId){ item in
            VStack(alignment: .leading){
                Text(item.trackName)
                    .font(.headline)
                
                Text(item.collectionName)
            }
            
        }
        .task {
            await loadData()
        }
    }
    func loadData() async{
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do{
            // data , meta deta or something
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data){
                results = decodedResponse.results
            }
        }catch{
            print("Invalid")
        }
            
        
    }
}

#Preview {
    ContentView()
}
