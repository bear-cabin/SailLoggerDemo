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
            if UIDevice.current.userInterfaceIdiom == .pad {
                ActionBar()
            }
        } detail: {
            Text("Empty")
        }
        if UIDevice.current.userInterfaceIdiom == .phone {
            ActionBar()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AppModel())
}
