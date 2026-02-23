//
//  ContentView.swift
//  Musics
//
//  Created by Guilherme Muniz Viana on 23/02/26.
//

import SwiftUI

struct ContentView: View {
    @State var results = [Result]()
    @State var search: (String, ) = String()

    var body: some View {
        NavigationStack {
            List(results, id: \.trackId) { item in
                VStack(alignment: .leading) {
                    Text(item.trackName)
                        .font(.headline)
                    Text(item.artistName)
                        .font(.subheadline)
                }
            }
            .task {
                await loadData()
            }
        }
        .searchable(text: $search)
        .onChange(of: search) { _, _ in
            Task {
                await loadData()
            }
        }
    }
    
    func loadData() async {
        
        let urlString = search.isEmpty
            ? "https://itunes.apple.com/search?term=pop&entity=song"
            : "https://itunes.apple.com/search?term=\(search)&entity=song"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    ContentView()
}
