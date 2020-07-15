//
//  GWScrollViewController.swift
//  GWOModuleVehicle
//
//  Created by yangshiyu on 2020/3/6.
//

import UIKit

open class GWScrollViewController: GWDemoMainViewController {

    open override func loadView() {
        super.loadView()
//        self.didSupportHeaderRefreshing = true
    }
    
     override open func viewDidLoad() {
           
        self.subVC = GWScrollExpansViewController.init()
        self.addChild(self.subVC!)
        super.viewDidLoad()
        self.tableView.bounces = false
       }
    
    override open func headerRefreshing() {
            
        var items:Array<GWCellConfig> = []
              
        let model = GWDemoCellModel.deserialize(from: [:])
        items.append(CellConfigurator<GWDemoTableViewCell>(model!))
        
        let policyModel = GWDemoCellModel.init(vc: self.subVC!)
        items.append(CellConfigurator<GWDemoTableViewCell>(policyModel))
         
        
        let ds = GWTableViewDataSource(items: [items], sections: [""])
        self.reloadData(data: ds)
        
        
    }

}
