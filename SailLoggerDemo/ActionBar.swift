//
//  EditView.swift
//  SailLoggerDemo
//
//  Created by 李招雄 on 2023/12/31.
//

import SwiftUI
import SailLogger

struct ActionBar: View {
    @State var text = "text"
    @State var level: Level = .error
    
    var body: some View {
        VStack {
            HStack {
                Text("Messgae:")
                TextField("Message", text: $text)
                    .textFieldStyle(.roundedBorder)
            }
            HStack {
                Picker("Level", selection: $level) {
                    ForEach(Level.allCases) { level in
                        Text(level.name).tag(level)
                    }
                }
                Spacer()
                Button {
                    SailLogger.log(msg: text, level: level)
                } label: {
                    Text("Log")
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
    }
}

#Preview {
    ActionBar()
}
