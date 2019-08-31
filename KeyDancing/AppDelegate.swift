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
        window.setIsVisible(false)
        CallBackFunctions.output = { chars in
            self.statusBarItem.button?.title = self.defaultStrategy(chars: chars)(self.statusBarItem.button?.title ?? "")
        }
    }
    
    @IBAction func showInWindow(_ sender: Any) {
        window.makeKey()
        window.setIsVisible(true)
        statusBarItem.button?.title = "KeyDancing"
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
            self.displayView?.setText(textOp: self.defaultStrategy(chars: chars))
        }
    }
    
    @IBAction func stopRegarding(_ sender: Any) {
         Keylogger.shared.stop()
    }
    
    @IBAction func safeExit(_ sender: Any) {
        Keylogger.shared.stop()
        exit(0)
    }
    
    func defaultStrategy(chars: String) -> (String) -> String {
        let res: (String)-> String = { ori in
            if ori.count < 15 {
                return ori + chars
            } else {
                var index = ori.firstIndex(of: ")")
                if index == nil || ori.hasPrefix(")") {
                    index = ori.index(ori.startIndex, offsetBy: 3)
                }
                return ori[index!..<ori.endIndex] + chars
            }
        }
        return res
    }
}

