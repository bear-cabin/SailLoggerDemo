//
//  FileAttribute.swift
//  SailLoggerDemo
//
//  Created by 李招雄 on 2023/12/30.
//

import Foundation
import SailLogger
import Combine

class FileAttribute: Identifiable, Equatable, Hashable {
    
    let id: String
    let name: String
    var content = ""
    
    init(name: String = "", attributes: [FileAttributeKey: Any] = [:]) {
        id = name
        self.name = name
    }
    
    func loadContent() {
        var url = FileLogger.shared.logsUrl
        url.appendPathComponent(name)
        if let text = try? String(contentsOf: url) {
            content = text
        }
    }
    
    static func == (lhs: FileAttribute, rhs: FileAttribute) -> Bool {
        lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
