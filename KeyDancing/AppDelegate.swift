//
//  AppDelegate.swift
//  KeyDancing
//
//  Created by 朱熙 on 2019/8/25.
//  Copyright © 2019 朱熙. All rights reserved.
//

import Cocoa

let screenFrame = NSScreen.main?.visibleFrame ?? NSRect.zero

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    lazy var window: NSWindow = {
        let space:CGFloat = 20
        let width:CGFloat = 300
        let height:CGFloat = 80
        let x = screenFrame.width - width - space
        let y = screenFrame.height - height - space
        
        let w = NSWindow.init(
            contentRect: NSRect.init(x: x, y: y, width: width, height: height),
            styleMask: [.borderless],
            backing: .buffered,
            defer: true
        )
        
        w.backgroundColor = .clear
        
        return w
    }()
    
    var displayView: DisplayView?
    
    var statusBarItem: NSStatusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    @IBOutlet weak var menu: NSMenu!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        statusBarItem.menu = menu
        statusBarItem.button?.title = "KeyDancing"
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func startRegarding(_ sender: Any) {
        Keylogger.shared.start()
    }
    
    @IBAction func showInStatusBar(_ sender: Any) {
        CallBackFunctions.output = { chars in
            if let title = self.statusBarItem.button?.title, title.count < 30 {
                self.statusBarItem.button?.title = title + chars
            } else {
                self.statusBarItem.button?.title = chars
            }
        }
    }
    
    @IBAction func showInWindow(_ sender: Any) {
        window.makeKey()
        window.setIsVisible(true)
        if displayView == nil {
            displayView = DisplayView.init(frame: NSRect.init(
                x: 0,
                y: 0,
                width: window.frame.width,
                height: window.frame.height
            ))
            window.contentView = displayView
        }
        
        CallBackFunctions.output = { chars in
            
            self.displayView?.setText(textOp: { (ori) -> String in
                if ori.count < 30 {
                    return ori + chars
                } else {
                    return chars
                }
            })
        }
    }
    
    @IBAction func stopRegarding(_ sender: Any) {
         Keylogger.shared.stop()
    }
}

