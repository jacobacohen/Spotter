//
//  AppDelegate.swift
//  Spotter
//
//  Created by Jacob Cohen on 4/7/18.
//  Copyright © 2018 Jacob Cohen. All rights reserved.
//
// Made with help from
// https://www.raywenderlich.com/165853/menus-popovers-menu-bar-apps-macos
import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength) // variableLength
    
    let popover = NSPopover()
    
    @objc func printQuote(_ sender: Any?) {
        let quotetext = "How's this work?"
        print("\(quotetext)")
    }
    
    @objc func togglePopover(_ sender: Any?) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
        
    }
    
    func showPopover(sender: Any?) {
        if let button = statusItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }
    
    func closePopover(sender: Any?) {
        popover.performClose(sender)
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let button = statusItem.button {
            button.image = NSImage(named: NSImage.Name(rawValue: "AppIcon")) //Figure out how to get icon
            button.action = #selector(togglePopover(_:))
        }
            popover.contentViewController = SpotterViewController.freshController()
            // constructMenu()
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func constructMenu() {
        let menu = NSMenu()
        
        menu.addItem(withTitle: "Play/Pause", action: #selector(AppDelegate.playpause(_:)), keyEquivalent: "a")
        menu.addItem(withTitle: "Play/Pause", action: #selector(AppDelegate.printQuote(_:)), keyEquivalent: "b")
        menu.addItem(NSMenuItem.separator())
        menu.addItem(withTitle: "Quit Spotter", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
        
        statusItem.menu = menu
        
    }
    
    //Applescripts (To be moved to separate library file)
    //Also needs to be updated for new Swift
    
    @objc func playpause(_ sender: Any?) {
        let scriptText = "tell application \"Spotify\"\nplaypause\nend tell"
        var error: NSDictionary?
        if let script = NSAppleScript(source: scriptText){
            script.executeAndReturnError(&error)
        }
        else if(error != nil) {
            print("error while pausing or playing")
        }
    }
    
    @objc func next() {
        let scriptText = "tell application \"Spotify\"\nnext track\nend tell"
        var error: NSDictionary?
        if let script = NSAppleScript(source: scriptText){
            script.executeAndReturnError(&error)
        }
        else if(error != nil) {
            print("error while pausing or playing")
        }
    }
    
    @objc func prev() {
        let scriptText = "tell application \"Spotify\"\nprevious track\nend tell"
        var error: NSDictionary?
        if let script = NSAppleScript(source: scriptText){
            script.executeAndReturnError(&error)
        }
        else if(error != nil) {
            print("error while pausing or playing")
        }
    }
    
    @objc func mute() {
        let scriptText = "tell application \"Spotify\"\nset sound volume to 0\nend tell"
        var error: NSDictionary?
        if let script = NSAppleScript(source: scriptText){
            script.executeAndReturnError(&error)
        }
        else if(error != nil) {
            print("error while pausing or playing")
        }
    }
    
    @objc func volumeUp() {
        let scriptText = "tell application \"Spotify\"\nif sound volume < 90 then\nset sound volume to sound volume + 10\nelse\nset sound volume to 100\nend if\nend tell"
        var error: NSDictionary?
        if let script = NSAppleScript(source: scriptText){
            script.executeAndReturnError(&error)
        }
        else if(error != nil) {
            print("error while pausing or playing")
        }
    }
    
    @objc func volumeDown() {
        let scriptText = "tell application \"Spotify\"\nif sound volume > 10 then\nset sound volume to sound volume - 10\nelse\nset sound volume to 0\nend if\nend tell"
        var error: NSDictionary?
        if let script = NSAppleScript(source: scriptText){
            script.executeAndReturnError(&error)
        }
        else if(error != nil) {
            print("error while pausing or playing")
        }
    }
    
}

