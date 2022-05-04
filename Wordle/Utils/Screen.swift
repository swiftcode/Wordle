//
//  Screen.swift
//  Faith
//
//  Created by mpc on 8/26/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

//FIXME: Don't need two definitions for bounds.  screenSize is used throughout
//the app.  Fix the references and stick with bounds in the code.
struct Screen {
    static let screenSize = UIScreen.main.bounds
    static let width = screenSize.width
    static let height = screenSize.height
    static let scale = UIScreen.main.scale
    static let bounds = UIScreen.main.bounds
    static let nativeBounds = UIScreen.main.nativeBounds
}
