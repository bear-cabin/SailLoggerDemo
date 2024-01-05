//
//  FileAttribute.swift
//  SailLoggerDemo
//
//  Created by 李招雄 on 2023/12/30.
//

import Foundation
import SailLogger
import Combine

class FileAttribute: ObservableObject, Identifiable, Equatable, Hashable {
    
    let id: String
    let name: String
    let url: URL
    var size = 0
    var content = ""
    
    init(name: String) {
        id = name
        self.name = name
        var url = FileLogger.shared.logsUrl
        url.appendPathComponent(name)
        self.url = url
        refreshAttributes()
    }
    
    func refreshAttributes() {
        let attributes = try? FileManager.default.attributesOfItem(atPath: url.path)
        if let size = attributes?[.size] as? Int {
            self.size = size
        }
    }
    
    func loadContent() {
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
