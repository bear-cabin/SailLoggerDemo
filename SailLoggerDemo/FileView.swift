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
    let file: FileAttribute
    
    var info: FileAttribute {
        if file == model.changedFile {
            return model.changedFile!
        }
        if file.content.isEmpty {
            file.loadContent()
        }
        return file
    }

    var body: some View {
        ScrollView { 
            Text(info.content)
        }
    }
}
