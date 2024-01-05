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
    let device = UIDevice.current.userInterfaceIdiom

    var body: some View {
        NavigationSplitView {
            List(model.files) { file in
                NavigationLink {
                    FileView(file: file)
                } label: {
                    Text(file.name)
                }
            }
            if device == .pad {
                ActionBar()
            }
        } detail: {
            Text("Empty")
        }
        if device == .phone {
            ActionBar()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AppModel())
}
