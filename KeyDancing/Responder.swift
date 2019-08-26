//
//  Responder.swift
//  KeyDancing
//
//  Created by 朱熙 on 2019/8/25.
//  Copyright © 2019 朱熙. All rights reserved.
//

import Foundation
import Cocoa

class Responder: NSResponder {
    override func keyDown(with event: NSEvent) {
        print(event)
        super.keyDown(with: event)
    }
}
