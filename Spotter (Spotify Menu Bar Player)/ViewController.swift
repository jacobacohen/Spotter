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

    var buttonPresses = 0
    var statusBar = NSStatusBar.system()
    var statusBarItem : NSStatusItem = NSStatusItem()
    var openMenuItem : NSMenuItem = NSMenuItem()
    var exitMenuItem : NSMenuItem = NSMenuItem()
    var theMenu = NSMenu()
    
    @IBOutlet weak var button: NSButton!
    @IBOutlet weak var TextTitle: NSTextField!
    @IBAction func PressButton(_ sender: Any) {
        buttonPresses += 1
        setLabelMessage()
    }
    
    override func awakeFromNib() {
        setLabelMessage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        statusBarItem = statusBar.statusItem(withLength: -1)
        statusBarItem.menu = theMenu
        
        openMenuItem.title = "Open"
        openMenuItem.target = self
        openMenuItem.action = #selector(setWindowVisible)
        openMenuItem.keyEquivalent = ""
        
        exitMenuItem.title = "Quit"
        exitMenuItem.target = self
        exitMenuItem.action = #selector(quit)
        exitMenuItem.keyEquivalent = ""
        
        theMenu.addItem(openMenuItem)
        theMenu.addItem(exitMenuItem)
        setLabelMessage()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func setLabelMessage(){
        TextTitle.stringValue = "You've Pressed the button"
        statusBarItem.button?.title = "Presses: \(buttonPresses)"
    }

    func setWindowVisible(sender: AnyObject){
        self.view.window!.orderFrontRegardless()
    }
    
    func quit(sender: AnyObject) {
        NSApp.terminate(self)
    }
}

