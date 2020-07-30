//
//  MVVMViewController.swift
//  YHLCore_Example
//
//  Created by yangshiyu on 2020/7/29.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import YHLCore
import RxCocoa
import RxSwift

class ValidViewModel {
    
    let uservalid:Observable<Bool>
    let passvalid:Observable<Bool>
    let everyValid:Observable<Bool>
    
    init(user:Observable<String>,pass:Observable<String>) {
        uservalid = user.map{
            $0.characters.count >= 4
        }.share(replay: 1)
        
        passvalid = pass.map{
            $0.characters.count >= 6
        }.share(replay: 1)
        
        everyValid = Observable.combineLatest(uservalid,passvalid){
            $0 && $1
        }.share(replay: 1)
    }
}


class MVVMViewController: BaseViewController {

    lazy var sliderView: GWDrivingMapTimeSlideView = {
        let view = GWDrivingMapTimeSlideView()
        return view
    }()
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var passLabel: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var slider: UISlider!
    var viewModel:ValidViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        viewModel = ValidViewModel(user: nameText.rx.text.orEmpty.asObservable(), pass: passText.rx.text.orEmpty.asObservable())
//        viewModel?.uservalid.bind(to: passText.rx.isEnabled).disposed(by: disposeBag)
//        viewModel?.uservalid.bind(to: nameLabel.rx.isHidden).disposed(by: disposeBag)
//        viewModel?.passvalid.bind(to: passLabel.rx.isHidden).disposed(by: disposeBag)
//        viewModel?.everyValid.bind(to: button.rx.isEnabled).disposed(by: disposeBag)
        
        button.rx.tap.subscribe(onNext:{
            [weak self] in
            self?.slider.transform = CGAffineTransform(rotationAngle: -.pi/2)
        })
        
        
        view.addSubview(sliderView)
        sliderView.backgroundColor = UIColor.lightGray
         sliderView.snp.makeConstraints { (make) in
             make.top.equalTo(16)
             make.right.equalTo(-16)
             make.width.equalTo(400)
             make.height.equalTo(349)
         }
    }
}
