//
//  GWDrivingMapTimeSlideView.swift
//  GWRoadTrip
//
//  Created by xdios-sf on 2020/7/29.
//  时间滑块

import Foundation
import UIKit
class GWDrivingMapTimeSlideView: UIView {
    
    var slider : UISlider = {
        let slider = UISlider()
        //最小值
        slider.minimumValue = 1
        //最大值
        slider.maximumValue = 4
        //设置默认值
        slider.value = 1
        //设置Slider两边槽的颜色
        slider.minimumTrackTintColor = UIColor.red
        slider.maximumTrackTintColor = UIColor.green
//        slider.setThumbImage(GWBundle.image(name: "mapLocation"), for: .normal)
        slider.addTarget(self, action: #selector(testSlider), for: .valueChanged)
        slider.isUserInteractionEnabled = true
        slider.backgroundColor = UIColor.red
        return slider
    }()
    var titleLab : UILabel = {
        let lab = UILabel()
        lab.text = "3天"
        lab.textAlignment = .center
        return lab
    }()
    var lineLab : UILabel = {
        let lab = UILabel()
        lab.backgroundColor = UIColor.gray
        return lab
    }()
    var allDayLab : UILabel = setLab()
    var threeDayMoreLab : UILabel = setLab()
    var threeDayLab : UILabel = setLab()
    var twoDayLab : UILabel = setLab()
    var oneDayLab : UILabel = setLab()
    static func setLab() -> UILabel {
        let lab = UILabel()
        lab.textColor = UIColor.black
        lab.font = UIFont.systemFont(ofSize: 11)
        lab.numberOfLines = 2
        lab.textAlignment = .center
        lab.backgroundColor = UIColor.green
        return lab
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 6
        self.addSubview(titleLab)
        self.addSubview(lineLab)
        self.addSubview(slider)
        self.addSubview(allDayLab)
        self.addSubview(threeDayMoreLab)
        self.addSubview(threeDayLab)
        self.addSubview(twoDayLab)
        self.addSubview(oneDayLab)
        allDayLab.text = "全部"
        threeDayMoreLab.text = "3天\n以上"
        threeDayLab.text = "3天"
        twoDayLab.text = "2天"
        oneDayLab.text = "1天"
        allDayLab.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(test)))
        allDayLab.isUserInteractionEnabled = true
        
        titleLab.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(7)
            make.height.equalTo(33)
            make.left.right.equalToSuperview()
        }
        lineLab.snp.makeConstraints { (make) in
            make.top.equalTo(titleLab.snp.bottom).offset(10)
            make.height.equalTo(1)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
        }
        let sliderH : CGFloat = 276
        let dayLabH : CGFloat = 16
        let lineH : CGFloat = (sliderH - dayLabH*6)/4
        slider.snp.makeConstraints { (make) in
            make.top.equalTo(lineLab.snp.bottom).offset(12+sliderH/2-2)
            make.height.equalTo(4)
            make.centerX.equalToSuperview()
            make.width.equalTo(sliderH)
        }
        allDayLab.snp.makeConstraints { (make) in
            make.top.equalTo(lineLab.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.height.equalTo(dayLabH)
        }
        threeDayMoreLab.snp.makeConstraints { (make) in
            make.top.equalTo(allDayLab.snp.bottom).offset(lineH)
            make.centerX.equalToSuperview()
            make.height.equalTo(dayLabH*2)
        }
        threeDayLab.snp.makeConstraints { (make) in
            make.top.equalTo(threeDayMoreLab.snp.bottom).offset(lineH)
            make.centerX.equalToSuperview()
            make.height.equalTo(dayLabH)
        }
        twoDayLab.snp.makeConstraints { (make) in
            make.top.equalTo(threeDayLab.snp.bottom).offset(lineH)
            make.centerX.equalToSuperview()
            make.height.equalTo(dayLabH)
        }
        oneDayLab.snp.makeConstraints { (make) in
            make.top.equalTo(twoDayLab.snp.bottom).offset(lineH)
            make.centerX.equalToSuperview()
            make.height.equalTo(dayLabH)
        }
       
    }
    
    @objc func testSlider() {
        //325
        //275+15=290
    }
    @objc func test() {
        slider.transform = CGAffineTransform(rotationAngle: -.pi/2);
    }
}
