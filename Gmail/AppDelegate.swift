//
//  AppDelegate.swift
//  Gmail
//
//  Created by Eli Byers on 6/21/18.
//  Copyright © 2018 Eli Byers. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        if let window = sender.windows.first {
            if flag {
                window.orderFront(nil)
            } else {
                window.makeKeyAndOrderFront(nil)
            }
        }
        return true
    }
    
    func applicationWillBecomeActive(_ notification: Notification) {
        if let window =  NSApplication.shared.windows.first {
            if window.isVisible {
                window.orderFront(nil)
            } else {
                window.makeKeyAndOrderFront(nil)
            }
        }
    }

}

