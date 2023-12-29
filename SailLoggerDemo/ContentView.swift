//
//  ContentView.swift
//  SailLoggerDemo
//
//  Created by 李招雄 on 2023/12/29.
//

import SwiftUI
import SailLogger
import Combine

struct ContentView: View {
    @EnvironmentObject var model: AppModel

    var body: some View {
        NavigationSplitView {
            List(model.fileInfos) { info in
                Button(info.name) {
                    model.selectedFile = info
                    info.loadContent()
                }
            }
            .toolbar {
                Button {
                    SailLogger.log(msg: "error", level: .error)
                    model.reloadFileNames()
                } label: {
                    Text("log")
                }
            }
        } detail: {
            FileView()
        }
    }
}

#Preview {
    ContentView()
}
