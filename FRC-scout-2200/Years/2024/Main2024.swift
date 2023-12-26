//
//  Main2024.swift
//  FRC-scout-2200
//
//  Created by Hugo Klepsch on 2023-12-19.
//

import SwiftUI

struct Main2024: View {
    private enum Field: Int, CaseIterable {
        case team, match
    }
    
    @FocusState private var focusedField: Field?
    
    @State private var team = ""
    @State private var isQualifying = true
    @State private var match = ""
    
    @State private var todoCount = 0
    @State private var todoBool = false
    
    func toQRString() -> String {
        let columns = [
            String(match),
            String(team),
        ]
        return columns.joined(separator: String(format: "\t")) + String(format: "\n")
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section("General") {
                    TextEntryWithLabel(hint: "Team number", text: $team, numeric: true, focusVar: $focusedField,
                                       focusValue: Field.team, validator: numericValidator)
                    Toggle(isOn: $isQualifying) {
                        Text("Qualifying match")
                    }
                    TextEntryWithLabel(hint: isQualifying ? "Qualifying match (q1, Q84 etc)" : "Match (QFR1M1, FM1 etc)", 
                                       text: $match, numeric: false,
                                       focusVar: $focusedField, focusValue: Field.match,
                                       validator: { (value) in
                        // TODO: validate this match name better
                        return true
                    })
                }
                Section("Autonomous") {
                }
                Section("Teleoperated") {
                }
                Section {
                    NavigationLink(destination: QRViewer(toQRString())) {
                        Text("Generate QR Code")
                    }
                }
            }
            .navigationTitle("2024")
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("Close Keyboard") {
                        focusedField = nil
                    }
                }
            }
        }
    }
}

#Preview {
    Main2024()
}
