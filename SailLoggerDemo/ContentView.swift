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
                NavigationLink {
                    FileView(file: info)
                } label: {
                    Text(info.name)
                }
            }
            .toolbar {
                Button {
                    SailLogger.log(msg: "error", level: .error)
                } label: {
                    Text("log")
                }
            }
        } detail: {
            Text("Empty")
        }
    }
}
