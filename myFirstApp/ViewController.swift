//
//  ViewController.swift
//  myFirstApp
//
//  Created by zhenxingsun on 2024/5/19.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var pokerFaceImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "nosmile"))
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        return imageView
    }()
    
    private lazy var smileImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "smile"))
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        return imageView
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom) // 声明一个自定义的按钮
        // 设置按钮属性
        button.backgroundColor = UIColor.lightGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40) // 字体
        return button
    }()
    
    // private var isSmiling: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 图片
        // 设置布局
        self.pokerFaceImageView.frame = self.view.bounds
        self.smileImageView.frame = self.view.bounds
        
        // 添加视图: 视图层级，后面添加的图片会覆盖前面添加的图片.
        self.view.addSubview(self.pokerFaceImageView)
        self.view.addSubview(self.smileImageView)
        
        // 按钮
        // 设置布局
        let buttonHeiht: CGFloat = 110
        self.button.frame = CGRect(x: 0, y: self.view.frame.height - buttonHeiht, width: self.view.frame.width, height: buttonHeiht)
        // 设置按钮的标题
        self.button.setTitle("😄", for: UIControl.State.normal) // 标题&显示时机
        self.button.setTitle("😭", for: UIControl.State.selected)
        // 设置点击事件
        self.button.addTarget(self, action: #selector(didClickButton(button:)), for: UIControl.Event.touchUpInside) // for参数是表示按钮在什么事件的情况下触发
        
        // 添加按钮视图
        self.view.addSubview(self.button)
        
        self.update(isSmiling: false)
    }
    
    @objc private func didClickButton(button: UIButton) {
        update(isSmiling: !button.isSelected)
    }
    
    private func update(isSmiling: Bool) {
        if isSmiling {
            self.smileImageView.isHidden = true
            self.pokerFaceImageView.isHidden = false
            self.button.isSelected = true            // 隐藏属性居然能直接设置！
        } else {
            self.smileImageView.isHidden = false
            self.pokerFaceImageView.isHidden = true
            self.button.isSelected = false
        }
    }
}

