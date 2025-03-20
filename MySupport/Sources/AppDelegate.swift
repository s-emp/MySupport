//
//  AppDelegate.swift
//  MySupport
//
//  Created by Emp on 20.03.2025.
//

import AppKit
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    private var statusBarItem: NSStatusItem!
    private var popover: NSPopover!
    private var settingsWindowController: NSWindowController?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Скрываем окно приложения
        NSApp.setActivationPolicy(.accessory)
        
        // Создаем popover
        popover = NSPopover()
        popover.contentSize = NSSize(width: 300, height: 200)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: PopoverContentView(showSettings: showSettings))
        
        // Создаем иконку в статус-баре
        statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let button = statusBarItem.button {
            button.image = NSImage(systemSymbolName: "star.fill", accessibilityDescription: "Status Bar Icon")
            button.action = #selector(togglePopover)
            button.target = self
        }
    }
    
    @objc func togglePopover(_ sender: AnyObject?) {
        if let button = statusBarItem.button {
            if popover.isShown {
                popover.performClose(nil)
            } else {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
                popover.contentViewController?.view.window?.makeKey()
            }
        }
    }
    
    func showSettings() {
        if settingsWindowController == nil {
            let settingsView = SettingsView()
            let hostingController = NSHostingController(rootView: settingsView)
            
            let window = NSWindow(
                contentRect: NSRect(x: 0, y: 0, width: 350, height: 400),
                styleMask: [.titled, .closable],
                backing: .buffered,
                defer: false
            )
            window.title = "Настройки"
            window.center()
            window.contentViewController = hostingController
            
            settingsWindowController = NSWindowController(window: window)
        }
        
        settingsWindowController?.showWindow(nil)
        settingsWindowController?.window?.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
    }
}
