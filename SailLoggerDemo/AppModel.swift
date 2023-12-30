//
//  AppModel.swift
//  SailLoggerDemo
//
//  Created by 李招雄 on 2023/12/30.
//

import Foundation
import SailLogger

@Observable
class AppModel {
    let key = FileAttributeKey("name")
    let logsUrl = FileLogger.shared.logsUrl()
    var infos = [FileAttribute]()
    
    init() {
        SailLogger.shared.level = .all
        SailLogger.shared.output = [.console, .file]
    }
    
    func reloadLogs() {
        var infos = [FileAttribute]()
        do {
            let names = try FileManager.default.contentsOfDirectory(atPath: logsUrl.path)
                .sorted(by: >)
            for name in names {
                let url = logsUrl.appendingPathComponent(name)
                let attributes = try FileManager.default.attributesOfItem(atPath: url.path)
                if let attr = FileAttribute(name: name, attributes: attributes) {
                    infos.append(attr)
                }
            }
        } catch {
            print(error)
        }
        self.infos = infos
    }
}
