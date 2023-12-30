//
//  ContentView.swift
//  FRC-scout-2200
//
//  Created by Hugo Klepsch on 2023-12-19.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    @State private var multiSelection = Set<UUID>()
    var body: some View {
        NavigationStack{
            List {
                Section(header: Text("Years")) {
                    NavigationLink(destination: Main2024()) {
                        Text("2024 (coming soon)")
                    }
                    .disabled(true)
                    NavigationLink(destination: Main2023()) {
                        Text("2023")
                    }
                }
            }
            .navigationTitle("Scout")
        }
    }
}

#Preview {
    ContentView()
}
