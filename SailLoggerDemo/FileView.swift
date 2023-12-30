//
//  FileView.swift
//  SailLoggerDemo
//
//  Created by 李招雄 on 2023/12/29.
//

import SwiftUI
import SailLogger

struct FileView: View {
    let name: String
    let logsUrl = FileLogger.shared.logsUrl()
    
    var text: String {
        let url = logsUrl.appending(component: name)
        if let text = try? String(contentsOf: url) {
            return text
        }
        return ""
    }
    
    init(name: String) {
        self.name = name
    }
    
    var body: some View {
        ScrollView {
            Text(text)
        }
    }
}

#Preview {
    FileView(name: "2023-12-29.log")
}
