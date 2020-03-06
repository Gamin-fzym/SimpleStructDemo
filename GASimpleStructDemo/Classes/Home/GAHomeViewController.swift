//
//  GAHomeViewController.swift
//  GASimpleStructDemo
//
//  Created by Gamin on 2020/2/25.
//  Copyright © 2020 gamin.com. All rights reserved.
//

import UIKit

class GAHomeViewController: GABaseViewController {

    @IBOutlet weak var classifyTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var classifyView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var lineView: UIView!
    var currentViewController: UIViewController?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        classifyTopConstraint.constant = CGFloat(STATUSBAR_HIGH + NAV_HIGH);
        setupClassifyAction();
        setupChildViewControllerAction();
        tapClassifyButton(sender: classifyView.viewWithTag(1000) as! UIButton);
    }
    
    func setupClassifyAction() {
        let classifyButs = classifyView.subviews;
        for subView in classifyButs {
            if (subView.isKind(of: UIButton.self)) {
                (subView as! UIButton).addTarget(self, action: #selector(tapClassifyButton(sender:)), for: .touchUpInside);
            }
        }
    }
    
    @objc func tapClassifyButton(sender: UIButton) {
        setupNormalButtonStyle();
        let index = sender.tag;

        sender.setTitleColor(HEXCOLOR(c: 0x007AFF), for: .normal);
        sender.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16);
        lineView.center = CGPoint(x: sender.center.x, y: lineView.center.y);
        showChildViewController(index: index);
    }
    
    func setupNormalButtonStyle() {
        let classifyButs = classifyView.subviews;
        for subView in classifyButs {
            if (subView.isKind(of: UIButton.self)) {
                let but = subView as! UIButton;
                but.setTitleColor(HEXCOLOR(c: 0x333333), for: .normal);
                but.titleLabel?.font = UIFont.systemFont(ofSize: 14);
            }
        }
    }

    // 选择将要切换后的控制器
    func selectViewController(index: Int) -> (UIViewController?) {
        var selectVC:UIViewController?;
        for vc in children {
            if (index == 1000 && vc.isKind(of: GANewsViewController.self)) {
                selectVC = vc;
                break;
            } else if (index == 1001 && vc.isKind(of: GAVideoViewController.self)) {
                selectVC = vc;
                break;
            } else if (index == 1002 && vc.isKind(of: GAAttentionViewController.self)) {
                selectVC = vc;
                break;
            }
        }
        return selectVC;
    }
    
    // 设置ChildVC
    func setupChildViewControllerAction() {
        addChild(GANewsViewController());
        addChild(GAVideoViewController());
        addChild(GAAttentionViewController());
    }
    
    // 展示childVC
    func showChildViewController(index: Int) {
        // 切换后的控制器
        let selectVC:UIViewController? = selectViewController(index: index);
        // 守护nextVC
        guard let nextVC = selectVC else {
            return;
        }
        contentView.addSubview(nextVC.view);
        nextVC.view.frame = contentView.bounds;
        nextVC.didMove(toParent: self);
        
        // 守护currentVC
        guard let currentVC = currentViewController else {
            currentViewController = selectVC;
            return;
        }

        // 若选择切换的控制器就是当前的控制器，则离开不进行控制器切换
        if nextVC.isKind(of: currentVC.classForCoder) {
            return;
        }
        
        // 切换childViewController  UIViewAnimationOptionTransitionNone
        transition(from: currentVC, to: nextVC, duration: 1, options: UIView.AnimationOptions(rawValue: 0), animations: {

        }) { (finished) in

        }
        currentViewController = nextVC;
    }
    
}
