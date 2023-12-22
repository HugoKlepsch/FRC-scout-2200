//
//  Main2024.swift
//  FRC-scout-2200
//
//  Created by Hugo Klepsch on 2023-12-19.
//

import SwiftUI

struct Main2024: View {
    @State private var notifyMeAbout = true
    @State private var playNotificationSounds = true
    @State private var sendReadReceipts = true
    @State private var profileImageSize = 0
    @State private var counter = 0
    var body: some View {
        VStack {
            Text("Hello from 2024")
            Form {
                Section(header: Text("Notifications")) {
                    Picker("Notify Me About", selection: $notifyMeAbout) {
                        Text("Direct Messages")
                        Text("Mentions")
                        Text("Anything")
                    }
                    Toggle("Play notification sounds", isOn: $playNotificationSounds)
                    Toggle("Send read receipts", isOn: $sendReadReceipts)
                }
                Section(header: Text("User Profiles")) {
                    LabeledContent(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/) {
                        HStack() {
                            Button("-") {
                                counter -= 1
                            }.colorInvert()
                            Text(String(format: "%d", counter))
                                .frame(width: 30.0)
                            Button("+") {
                                counter += 1
                            }
                            Gauge(value: Double(counter), in: 0...100) {
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    Main2024()
}
