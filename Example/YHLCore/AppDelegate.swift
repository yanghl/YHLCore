//
//  AppDelegate.swift
//  YHLCore
//
//  Created by 272789124@qq.com on 07/09/2020.
//  Copyright (c) 2020 272789124@qq.com. All rights reserved.
//

import UIKit
import YHLCore
import URLNavigator

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
        APIManager.init(scheme: .common)
        return true
    }

}

extension APIManager {
    func registAllRouter() {
//        distributeRouterNavinfoHVehicle(GWNavigator.shared)
        
        distributeRouterOModuleVehicleExample(YHLNavigator.shared)
        
    }
}

/// 这部分是给组件工程的使用示例
public extension APIManager {
    func distributeRouterOModuleVehicleExample(_ navigator: YHLNavigatorType & NavigatorType) {
       
        
        
    }
}

