//
//  GWScrollDemoViewController.swift
//  GWOModuleVehicle
//
//  Created by yangshiyu on 2020/3/6.
//

import UIKit

class GWScrollDemoViewController: GWDemoViewController {
    
    override func loadView() {
        super.loadView()
        self.didSupportHeaderRefreshing = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.bounces = true
        // Do any additional setup after loading the view.
    }
    
    override func headerRefreshing() {
        
        var items:Array<GWCellConfig> = []
        
        let config = CellConfigurator<GWDemoTableViewCell>(GWDemoCellModel.deserialize(from: [:])!)
        config.cacheHeight = 342
        items.append(config)
        
        
        let config2 = CellConfigurator<GWDemoTableViewCell>(GWDemoCellModel.deserialize(from: [:])!)
        config2.cacheHeight = 342
        items.append(config2)
        
        let config1 = CellConfigurator<GWDemoTableViewCell>(GWDemoCellModel.deserialize(from: [:])!)
        config1.cacheHeight = 342
        items.append(config1)
        
        let config3 = CellConfigurator<GWDemoTableViewCell>(GWDemoCellModel.deserialize(from: [:])!)
        config3.cacheHeight = 342
        items.append(config3)
        
        let config4 = CellConfigurator<GWDemoTableViewCell>(GWDemoCellModel.deserialize(from: [:])!)
        config4.cacheHeight = 342
        items.append(config4)
        
        
        
        
        let ds = GWTableViewDataSource(items: [items], sections: [""])
        self.reloadData(data: ds)
        
        
    }
    
}
