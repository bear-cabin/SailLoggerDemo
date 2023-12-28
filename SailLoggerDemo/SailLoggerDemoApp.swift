//
//  SailLoggerDemoApp.swift
//  SailLoggerDemo
//
//  Created by 李招雄 on 2023/12/29.
//

import SwiftUI

@main
struct SailLoggerDemoApp: App {
    let model = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
