//
//  MoveToSkyApp.swift
//  MoveToSky
//
//  Created by 秋星桥 on 5/23/25.
//

import SkyLightWindow
#if OpenSwiftUI
import OpenSwiftUI
#else
import SwiftUI
#endif

@main
struct MoveToSkyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .moveToSky()
        }
        #if !OpenSwiftUI
        .windowStyle(.hiddenTitleBar)
        .windowResizability(.contentMinSize)
        #endif
    }
}
