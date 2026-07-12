//
//  SwiftUI+MoveToSky.swift
//  SkyLightWindow
//
//  Created by 秋星桥 on 5/23/25.
//

import Foundation
import SwiftUI

public extension View {
    func moveToSky() -> some View {
        modifier(MoveToSkyModifier())
    }
}

struct MoveToSkyModifier: ViewModifier {
    @State var window: NSWindow? = nil
    @State var hasMoved = false

    func body(content: Content) -> some View {
        content
            .background {
                WindowReadingView($window)
            }
            .onChange(of: window) {
                guard !hasMoved, let window else { return }
                hasMoved = true
                SkyLightOperator.shared.delegateWindow(window)
            }
    }
}
