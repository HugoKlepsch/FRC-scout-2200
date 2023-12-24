//
//  Main2023.swift
//  FRC-scout-2200
//
//  Created by Hugo Klepsch on 2023-12-21.
//

import SwiftUI


struct Main2023: View {
    @State private var team = ""
    @State private var teamNumber = 0
    @State private var numConesInAuto = 0
    @State private var numCubesInAuto = 0
    let range = 0...500
    @State private var movedInAuto = false
    @State private var dockedInAuto = false
    @State private var balancedInAuto = false
    
    @State private var numConesInTele = 0
    @State private var numCubesInTele = 0
    @State private var dockedInTele = false
    @State private var balancedInTele = false
    
    func toQRString() -> String {
        let columns = [
            String(team),
            String(numConesInAuto),
            String(numCubesInAuto),
            String(movedInAuto),
            String(dockedInAuto),
            String(balancedInAuto),
            String(numConesInTele),
            String(numCubesInTele),
            String(dockedInTele),
            String(balancedInTele),
        ]
        return columns.joined(separator: String(format: "\t")) + String(format: "\n")
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section("General") {
                    TextEntryWithLabel(hint: "Team", text: $team, numeric: true, validator: TextEntryWithLabel.numericValidator)
                }
                Section("Autonomous") {
                    Stepper(
                        value: $numConesInAuto,
                        in: range
                    ) {
                        Text("Cones: \(numConesInAuto)")
                            .foregroundStyle(Color.yellow)
                    }
                    Stepper(
                        value: $numCubesInAuto,
                        in: range
                    ) {
                        Text("Cubes: \(numCubesInAuto)")
                            .foregroundStyle(Color.purple)
                    }
                    Toggle(isOn: $movedInAuto) {
                        Text("Moved")
                    }
                    Toggle(isOn: $dockedInAuto) {
                        Text("Docked")
                    }
                    Toggle(isOn: $balancedInAuto) {
                        Text("Balanced")
                    }
                }
                Section("Teleoperated") {
                    Stepper(
                        value: $numConesInTele,
                        in: range
                    ) {
                        Text("Cones: \(numConesInTele)")
                            .foregroundStyle(Color.yellow)
                    }
                    Stepper(
                        value: $numCubesInTele,
                        in: range
                    ) {
                        Text("Cubes: \(numCubesInTele)")
                            .foregroundStyle(Color.purple)
                    }
                }
            }
            NavigationLink(destination: QRViewer(toQRString())) {
                Text("Generate QR Code")
            }
            .navigationTitle("2023")
        }
    }
}

#Preview {
    Main2023()
}
