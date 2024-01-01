//
//  EditView.swift
//  SailLoggerDemo
//
//  Created by 李招雄 on 2023/12/31.
//

import SwiftUI
import SailLogger

struct EditView: View {
    @State var text = ""
    @State var level: Level = .error
    
    var body: some View {
        List {
            HStack {
                Text("Message")
                Spacer()
                TextField("Message", text: $text)
                    .multilineTextAlignment(.trailing)
            }
            Picker("Level", selection: $level) {
                ForEach(Level.allCases) { level in
                    Text(level.name).tag(level)
                }
            }
        }
        Button("Log") {
            SailLogger.log(msg: text, level: level)
        }
    }
}

#Preview {
    EditView()
}
