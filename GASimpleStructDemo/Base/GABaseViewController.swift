//
//  GABaseViewController.swift
//  GASimpleStructDemo
//
//  Created by Gamin on 2020/2/25.
//  Copyright © 2020 gamin.com. All rights reserved.
//

import UIKit

class GABaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addNavPopButton();
    }
    
    func viewController() {

    }
    
    // 获取当前视图所在控制器
    func currentViewController() -> UIViewController? {
        for view in sequence(first: self.view.superview, next: {$0?.superview}) {
            if let responder = view?.next {
                if responder.isKind(of: UIViewController.self){
                    return responder as? UIViewController
                }
            }
        }
        return nil
    }
    
    // 获取当前视图所在导航控制器
    func currentNavViewController() -> UINavigationController? {
        var n = next
        while n != nil {
            if n is UINavigationController {
                return n as? UINavigationController
            }
            n = n?.next
        }
        return nil
    }
    
    // 添加返回按钮
    func addNavPopButton() {
        // 这些类不需要返回按钮
        let limtVCS = ["GAHomeViewController", "GAShopViewController", "GAMessageViewController", "GAMineViewController"];
        let selfClassName = NSStringFromClass(self.classForCoder);
        for limt in limtVCS {
            if (limt == selfClassName.components(separatedBy: ".").last) {
                return;
            }
        }
        // leftBarButtonItem
        let leftCustomButton = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44));
        leftCustomButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);
        leftCustomButton.addTarget(self, action: #selector(popToPrepare), for: .touchUpInside);
        leftCustomButton.setImage(UIImage(named: "nav_back.png"), for: .normal);
        leftCustomButton.setImage(UIImage(named: "nav_back.png"), for: .highlighted);
        let leftButtonItem = UIBarButtonItem(customView: leftCustomButton);
        navigationItem.leftBarButtonItem = leftButtonItem;
    }
    
    @objc func popToPrepare() {
        var result = true;
        let vcs = (self.navigationController?.viewControllers) ?? [] ;
        if (vcs.count == 1) {
            if ((vcs.first) != nil) {
                vcs.first?.isKind(of: GAPublishViewController.self);
                result = false;
            }
        }
        if (result) {
            self.navigationController?.popViewController(animated: true);
        } else {
            dismiss(animated: true, completion: nil);
        }
    }
}
