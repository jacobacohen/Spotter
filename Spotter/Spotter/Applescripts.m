//
//  Applescripts.m
//  Spotter
//
//  Created by Jacob Cohen on 4/7/18.
//  Copyright © 2018 Jacob Cohen. All rights reserved.
//

#import <Foundation/Foundation.h>

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
