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
    @Published var changedFile: FileAttribute?
    var infosDict = [String: FileAttribute]() // key: name
    var cancellables = Set<AnyCancellable>()

    init() {
        SailLogger.shared.level = .all
        SailLogger.shared.output = [.console, .file]
        FileLogger.shared.fileContentSubject
            .sink { name in
                if let info = self.infosDict[name] {
                    info.loadContent()
                    self.changedFile = info
                }
            }
            .store(in: &cancellables)
        FileLogger.shared.fileNamesSubject
            .sink {
                self.reloadFileInfos()
            }
            .store(in: &cancellables)
        reloadFileInfos()
    }
        
    func reloadFileInfos() {
        do {
            var infos = [FileAttribute]()
            let logsUrl = FileLogger.shared.logsUrl
            let names = try FileManager.default.contentsOfDirectory(atPath: logsUrl.path)
            for name in names {
                let url = logsUrl.appendingPathComponent(name)
                if let info = infosDict[name] {
                    infos.append(info)
                } else {
                    let attributes = try FileManager.default.attributesOfItem(atPath: url.path)
                    let info = FileAttribute(name: name, attributes: attributes)
                    infosDict[name] = info
                    infos.append(info)
                }
            }
            fileInfos = infos.sorted { $0.name > $1.name }
        } catch {
            print(error)
        }
    }
    
}
