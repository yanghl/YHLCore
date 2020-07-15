//
//  ViewController.swift
//  YHLCore
//
//  Created by 272789124@qq.com on 07/09/2020.
//  Copyright (c) 2020 272789124@qq.com. All rights reserved.
//

import UIKit
import YHLCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnClick(_ sender: Any) {
        let vc = MallViewController()
        self.navigationController?.pushViewController(vc)
//        YHLNavigator.shared.push(vc)
    }
}

