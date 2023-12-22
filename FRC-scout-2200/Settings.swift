//
//  Settings.swift
//  FRC-scout-2200
//
//  Created by Hugo Klepsch on 2023-12-21.
//

import SwiftUI

struct Settings: View {
    @State private var playNotificationSounds = true
    @State private var sendReadReceipts = true
    @State private var profileImageSize = 0
    @State private var counter = 0
    private var notifyMeAbout = [
        "Direct Messages",
        "Mentions",
        "Anything"
    ]
    @State private var notifyMeAboutSelection = "Mentions"
    
    var body: some View {
        NavigationStack{
            VStack {
                Form {
                    Section(header: Text("Notifications")) {
                        Picker("Notify Me About", selection: $notifyMeAboutSelection) {
                            ForEach(notifyMeAbout, id: \.self) { option in
                                Text(option).tag(option)
                            }
                        }
                        Toggle("Play notification sounds", isOn: $playNotificationSounds)
                        Toggle("Send read receipts", isOn: $sendReadReceipts)
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    Settings()
}
