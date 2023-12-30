//
//  FileAttribute.swift
//  SailLoggerDemo
//
//  Created by 李招雄 on 2023/12/30.
//

import Foundation

struct FileAttribute: Identifiable {
    var id: Int
    let name: String
    
    init?(name: String, attributes: [FileAttributeKey: Any]) {
        if let date = attributes[.creationDate] as? Date {
            id = Int(date.timeIntervalSince1970)
        } else {
            return nil
        }
        self.name = name
    }
}
