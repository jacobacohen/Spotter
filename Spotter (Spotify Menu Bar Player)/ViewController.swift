//
//  ViewController.swift
//  Spotter (Spotify Menu Bar Player)
//
//  Created by Jacob Cohen on 5/29/17.
//  Copyright © 2017 Jacob Cohen. All rights reserved.
//
//Created with great assistance from the following guide by John Mullins:
//http://www.johnmullins.co/blog/2014/08/08/menubar-app/
//And the updated version from bjrnt
//https://gist.github.com/bjrnt/aa6b5d1a86567c5c2c52677ec418b39a

import Cocoa

class ViewController: NSViewController {
    
    var statusBar = NSStatusBar.system()
    var statusBarItem : NSStatusItem = NSStatusItem()
    var theMenu: NSMenu = NSMenu()
    
    @IBOutlet weak var button: NSButton!
    @IBOutlet weak var TextTitle: NSTextField!
    @IBAction func PressButton(_ sender: Any) {
        
    }
    
    override func awakeFromNib() {
        setLabelMessage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statusBarItem = statusBar.statusItem(withLength: -1)
        statusBarItem.menu = theMenu
        
        theMenu.addItem(withTitle: "Open Console", action: #selector(setWindowVisible), keyEquivalent: "")
        theMenu.addItem(withTitle: "Play/Pause", action: #selector(pauseplay), keyEquivalent: "")
        theMenu.addItem(withTitle: "Previous Track", action: #selector(prev), keyEquivalent: "")
        theMenu.addItem(withTitle: "Next Track", action: #selector(next), keyEquivalent: "")
        theMenu.addItem(withTitle: "Volume Up", action: #selector(volumeUp), keyEquivalent: "")
        theMenu.addItem(withTitle: "Volume Down", action: #selector(volumeDown), keyEquivalent: "")
        theMenu.addItem(withTitle: "Mute", action: #selector(mute), keyEquivalent: "")
        theMenu.addItem(withTitle: "Quit", action: #selector(quit), keyEquivalent: "")
        for index in 0...7 {
            theMenu.item(at: index)?.target = self
        }
        
        setLabelMessage()
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    func setLabelMessage(){
        TextTitle.stringValue = "Welcome"
        statusBarItem.button?.title = "Spotter"
    }
    
    func setWindowVisible(sender: AnyObject){
        self.view.window!.orderFrontRegardless()
    }
    
    func pauseplay() {
        let scriptText = "tell application \"Spotify\"\nplaypause\nend tell"
        var error: NSDictionary?
        if let script = NSAppleScript(source: scriptText){
            script.executeAndReturnError(&error)
        }
        else if(error != nil) {
            print("error while pausing or playing")
        }
    }
    
    func next() {
        let scriptText = "tell application \"Spotify\"\nnext track\nend tell"
        var error: NSDictionary?
        if let script = NSAppleScript(source: scriptText){
            script.executeAndReturnError(&error)
        }
        else if(error != nil) {
            print("error while pausing or playing")
        }
    }
    
    func prev() {
        let scriptText = "tell application \"Spotify\"\nprevious track\nend tell"
        var error: NSDictionary?
        if let script = NSAppleScript(source: scriptText){
            script.executeAndReturnError(&error)
        }
        else if(error != nil) {
            print("error while pausing or playing")
        }
    }
    
    func mute() {
        let scriptText = "tell application \"Spotify\"\nset sound volume to 0\nend tell"
        var error: NSDictionary?
        if let script = NSAppleScript(source: scriptText){
            script.executeAndReturnError(&error)
        }
        else if(error != nil) {
            print("error while pausing or playing")
        }
    }
    
    func volumeUp() {
        let scriptText = "tell application \"Spotify\"\nif sound volume < 90 then\nset sound volume to sound volume + 10\nelse\nset sound volume to 100\nend if\nend tell"
        var error: NSDictionary?
        if let script = NSAppleScript(source: scriptText){
            script.executeAndReturnError(&error)
        }
        else if(error != nil) {
            print("error while pausing or playing")
        }
    }
    
    func volumeDown() {
        let scriptText = "tell application \"Spotify\"\nif sound volume > 10 then\nset sound volume to sound volume - 10\nelse\nset sound volume to 0\nend if\nend tell"
        var error: NSDictionary?
        if let script = NSAppleScript(source: scriptText){
            script.executeAndReturnError(&error)
        }
        else if(error != nil) {
            print("error while pausing or playing")
        }
    }

    func quit(sender: AnyObject) {
        NSApp.terminate(self)
    }
}

