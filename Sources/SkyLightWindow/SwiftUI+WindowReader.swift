//
//  SwiftUI+WindowReader.swift
//  SkyLightWindow
//
//  Created by 秋星桥 on 5/23/25.
//

import AppKit
#if OpenSwiftUI
import OpenSwiftUI
#else
import SwiftUI
#endif

struct WindowReadingView: NSViewRepresentable {
    @Binding private var window: NSWindow?

    init(_ window: Binding<NSWindow?>) {
        _window = window
    }

    func makeNSView(context _: Context) -> NSWindowReadingView {
        let nsView = NSWindowReadingView()
        nsView.windowPublisher = $window
        return nsView
    }

    func updateNSView(_: NSWindowReadingView, context _: Context) {}
}

class NSWindowReadingView: NSView {
    var windowPublisher: Binding<NSWindow?> = .constant(nil)

    override func viewWillMove(toWindow newWindow: NSWindow?) {
        guard let newWindow else { return }
        windowPublisher.wrappedValue = newWindow
    }
}
