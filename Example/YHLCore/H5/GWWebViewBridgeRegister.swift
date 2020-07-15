//
//  GWWebViewBridgeRegister.swift
//  superora_ios
//
//  Created by yangshiyu on 2020/2/10.
//  Copyright © 2020 xue. All rights reserved.
//

import UIKit
import YHLCore

class GWWebViewBridgeRegister: NSObject,JSBridgeModuleProtocol {
    func moduleSourceFile() -> String? {
            return Bundle.main.path(forResource: "GWJSBridge", ofType: "js")!
        }
        
        func attachToJSBridge(bridge: GWBridge) {
            testfun(bridge)
        }
        
        func testfun(_ bridge: GWBridge) {
            bridge.register(handlerName: "testfun") { (paramters, callback) in
                var data:[String:Any] = paramters!["data"] as! [String : Any]
                var param:[String:Any] = [:]
                param["a"] = data["a"]
                callback?(["data":param])
                //原生主动调用h5函数
//                bridge.bridge.call(handlerName: "window._testfun", data: param.toString(), callback: nil)
                
            }
        }
}
