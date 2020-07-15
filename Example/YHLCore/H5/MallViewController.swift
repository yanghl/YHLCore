//
//  MallViewController.swift
//  superora_ios
//
//  Created by yangshiyu on 2020/2/9.
//  Copyright © 2020 xue. All rights reserved.
//

import UIKit
import YHLCore

class MallViewController: GWWebViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let pagePath = Bundle.main.path(forResource: "mall", ofType: "html")
        let pageHtml = try! String(contentsOfFile: pagePath!, encoding: .utf8)
        self.openHTMLString(htmlString: pageHtml, baseURL: URL(fileURLWithPath: pagePath!))
    }

}
