//
//  AppDelegate.swift
//  KeyDancing
//
//  Created by 朱熙 on 2019/8/25.
//  Copyright © 2019 朱熙. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        Keylogger.shared.start()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

