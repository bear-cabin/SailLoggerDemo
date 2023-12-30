//
//  ContentView.swift
//  SailLoggerDemo
//
//  Created by 李招雄 on 2023/12/29.
//

import SwiftUI
import SailLogger

struct ContentView: View {
    @Environment(AppModel.self) var model

    var body: some View {
        NavigationSplitView {
            List(model.infos, id: \.id) { info in
                NavigationLink {
                    FileView(name: info.name)
                } label: {
                    Text(info.name)
                }
            }
            .toolbar {
                Button {
                    SailLogger.log(msg: "error", level: .error)
                    model.reloadLogs()
                } label: {
                    Text("log")
                }
            }
        } detail: {
            Text("Empty")
        }
    }
}

#Preview {
    ContentView()
}
