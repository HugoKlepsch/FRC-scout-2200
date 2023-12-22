//
//  Main2024.swift
//  FRC-scout-2200
//
//  Created by Hugo Klepsch on 2023-12-19.
//

import SwiftUI

struct Main2024: View {
    @State private var todoCount = 0
    @State private var todoBool = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack {
                    GroupBox(label: Text("Autonomous")) {
                        Stepper(
                            value: $todoCount,
                            in: 0...500
                        ) {
                            Text("TODO: \(todoCount)")
                        }
                        
                        Toggle(isOn: $todoBool) {
                            Text("TODO")
                        }
                    }
                    GroupBox(label: Text("Teleoperated")) {
                        Toggle(isOn: $todoBool) {
                            Text("TODO")
                        }
                    }
                }
            }
            Text("TODO: pass in data needed for QR viewer")
            NavigationLink(destination: QRViewer("This comes from 2024")) { // TODO: pass in data needed for QR viewer
                Text("QR Code")
            }
            .navigationTitle("2024")
        }
    }
}

#Preview {
    Main2024()
}
