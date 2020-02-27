//
//  GABaseNavigationController.swift
//  GASimpleStructDemo
//
//  Created by Gamin on 2020/2/26.
//  Copyright © 2020 gamin.com. All rights reserved.
//

import UIKit

class GABaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @objc func popToPrepare() {
        var result = true;
        let vcs = children;
        if (vcs.count == 1) {
            if ((vcs.first) != nil) {
                vcs.first?.isKind(of: GAPublishViewController.self);
                result = false;
            }
        }
        if (result) {
            popViewController(animated: true);
        } else {
            dismiss(animated: true, completion: nil);
        }
    }

}
