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
    @Binding var file: FileAttribute
    
    var content: Text {
        if file.content.isEmpty {
            file.loadContent()
        }
        return Text(file.content)
    }
    
    var body: some View {
        ScrollView { content }
    }
}
