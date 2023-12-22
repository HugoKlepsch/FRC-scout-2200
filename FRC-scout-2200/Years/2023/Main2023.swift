//
//  Main2023.swift
//  FRC-scout-2200
//
//  Created by Hugo Klepsch on 2023-12-21.
//

import SwiftUI


struct Main2023: View {
    @State private var numConesInAuto = 0
    @State private var numCubesInAuto = 0
    let range = 0...500
    @State private var movedInAuto = false
    @State private var dockedInAuto = false
    @State private var balancedInAuto = false
    
    @State private var numConesInTele = 0
    @State private var numCubesInTele = 0
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack {
                    GroupBox(label: Text("Autonomous")) {
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
                    GroupBox(label: Text("Teleoperated")) {
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
            }
            Text("TODO: pass in data needed for QR viewer")
            NavigationLink(destination: QRViewer("This comes from 2023")) { // TODO: pass in data needed for QR viewer
                Text("QR Code")
            }
            .navigationTitle("2023")
        }
    }
}

#Preview {
    Main2023()
}
