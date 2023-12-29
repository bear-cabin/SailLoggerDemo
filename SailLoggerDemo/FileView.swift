//
//  FileView.swift
//  SailLoggerDemo
//
//  Created by 李招雄 on 2023/12/29.
//

import SwiftUI
import SailLogger
import Combine

struct FileView: View {
    @EnvironmentObject var model: AppModel

    var body: some View {
        if let file = model.selectedFile {
            ScrollView {
                Text(file.content)
            }
        } else {
            Text("Empty")
        }
    }
}
