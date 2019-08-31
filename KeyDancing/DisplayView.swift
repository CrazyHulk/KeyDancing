//
//  DiaplayView.swift
//  KeyDancing
//
//  Created by 哔哩哔哩 on 2019/8/30.
//  Copyright © 2019 朱熙. All rights reserved.
//

import Cocoa

class DisplayView: NSView {
    
    lazy var textLabel:NSTextField = {
        let l = NSTextField()
        l.frame = self.frame
        l.stringValue = ""
        l.font = NSFont.systemFont(ofSize: 35)
        l.backgroundColor = .clear
        l.textColor = .black
        l.usesSingleLineMode = true
        l.alignment = NSTextAlignment.center
        l.layer?.backgroundColor = .clear
        l.isBezeled = false
        l.isEditable = false
        l.drawsBackground = false
        return l
    }()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        let yP = (frameRect.height - 40) / 2
        textLabel.frame = NSRect.init(x: 0, y: yP, width: frameRect.width, height: 40)
        addSubview(textLabel)
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        layer?.backgroundColor = NSColor.white.withAlphaComponent(0.6).cgColor
        layer?.masksToBounds = true
        layer?.cornerRadius = 10
    }
    
}

extension DisplayView {
    func setText(textOp: (String) -> String) {
        textLabel.stringValue = textOp(textLabel.stringValue)
    }
}
