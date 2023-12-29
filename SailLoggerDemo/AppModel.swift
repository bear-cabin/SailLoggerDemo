//
//  AppModel.swift
//  SailLoggerDemo
//
//  Created by 李招雄 on 2023/12/30.
//

import Foundation
import SailLogger
import Combine

class AppModel: ObservableObject {
    
    @Published var fileInfos = [FileAttribute]()
    var infosDict = [String: FileAttribute]()
    var cancellable: AnyCancellable?
    @Published var selectedFile: FileAttribute?

    init() {
        SailLogger.shared.level = .all
        SailLogger.shared.output = [.console, .file]
        let subject = FileLogger.shared.fileContentSubject
        cancellable = subject.sink { name in
            if let info = self.infosDict[name] {
                info.loadContent()
                self.selectedFile = info
            }
        }
    }
    
    func reloadFileNames() {
        var infos = [FileAttribute]()
        let logsUrl = FileLogger.shared.logsUrl
        do {
            let names = try FileManager.default.contentsOfDirectory(atPath: logsUrl.path)
            for name in names {
                if let info = infosDict[name] {
                    infos.append(info)
                } else {
                    let url = logsUrl.appendingPathComponent(name)
                    let attributes = try FileManager.default.attributesOfItem(atPath: url.path)
                    let info = FileAttribute(name: name, attributes: attributes)
                    infosDict[name] = info
                    infos.append(info)
                }
            }
        } catch {
            print(error)
        }
        fileInfos = infos.sorted { $0.name > $1.name }
    }
    
}
