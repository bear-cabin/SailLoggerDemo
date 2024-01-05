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
    
    @Published var files = [FileAttribute]()
    @Published var changedFile: FileAttribute?
    var cancellables = Set<AnyCancellable>()

    init() {
        SailLogger.shared.level = .all
        SailLogger.shared.output = [.console, .file]
        FileLogger.shared.fileContentSubject
            .sink { name in
                let file = FileAttribute(name: name)
                file.loadContent()
                self.changedFile = file
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
            let path = FileLogger.shared.logsUrl.path
            let names = try FileManager.default.contentsOfDirectory(atPath: path)
            for name in names {
                infos.append(FileAttribute(name: name))
            }
            files = infos
        } catch {
            print(error)
        }
    }
    
}
