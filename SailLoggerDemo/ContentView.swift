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
    
    func file(_ info: FileAttribute) -> Binding<FileAttribute> {
        Binding {
            info
        } set: { file in
            model.infosDict[file.name] = file
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List(model.fileInfos) { info in
                NavigationLink {
                    FileView(file: file(info))
                } label: {
                    Text(info.name)
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
