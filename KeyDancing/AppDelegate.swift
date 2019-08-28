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
    
    
    var statusBarItem: NSStatusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    @IBOutlet weak var menu: NSMenu!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        statusBarItem.menu = menu
        statusBarItem.button?.title = "KeyDancing"
        Keylogger.shared.start()
        CallBackFunctions.output = { chars in
            self.statusBarItem.button?.title = chars
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
}

