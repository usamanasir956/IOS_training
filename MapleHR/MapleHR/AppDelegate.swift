//
//  AppDelegate.swift
//  MapleHR
//
//  Created by Dev on 15/07/2022.
//

import UIKit
// For starting UI with Storyboard.
// 1: Remove UIScene Methods from AppDelegate File
// 2: Add window: UIWindow? property in this class.
// 3: Remove Application Scene Manifest from Info.Plist

enum Week<D> {
case monday(D), truesday(D), wednesday(D), thirsday(D), friday(D), saturday(D), sunday(D)
}


extension MyJSONDecoder where M == ApiModel<User> {
    func calculate() {
        
    }
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var simple_date: Week<Date> = .saturday(.now)
    var simple_string: Week<String> = .saturday("12/12/2022")
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let userDecoder = MyJSONDecoder<ApiModel<User>>()
        let homeDecoder = MyJSONDecoder<ApiModel<Home>>()
        userDecoder.calculate()
        
        
//        let legs = Leg()
//        let moving = Movable()
//        moving.move(mover: legs)
        return true
    }

}



extension Week {
    var data: D {
        switch self {
        case .monday(let d):
            return d
        case .truesday(let d):
            return d
        case .wednesday(let d):
            return d
        case .thirsday(let d):
            return d
        case .friday(let d):
            return d
        case .saturday(let d):
            return d
        case .sunday(let d):
            return d
        }
    }
}
