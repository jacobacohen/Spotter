//
//  SpotterViewController.swift
//  Spotter
//
//  Created by Jacob Cohen on 4/7/18.
//  Copyright © 2018 Jacob Cohen. All rights reserved.
//

import Cocoa

class SpotterViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}

extension SpotterViewController {
    static func freshController() ->
        SpotterViewController {
            let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
            let identifier = NSStoryboard.SceneIdentifier(rawValue: "SpotterViewController")
            guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? SpotterViewController else {
                fatalError("Can't find SpotterViewController (Main.storyboard")
            }
            return viewcontroller
    }
}
