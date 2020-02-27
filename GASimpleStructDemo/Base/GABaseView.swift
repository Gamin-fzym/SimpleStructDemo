//
//  GABaseView.swift
//  GASimpleStructDemo
//
//  Created by Gamin on 2020/2/27.
//  Copyright © 2020 gamin.com. All rights reserved.
//

import UIKit

class GABaseView: UIView {

    func currentViewController() -> UIViewController? {
        for view in sequence(first: self.superview, next: {$0?.superview}) {
            if let responder = view?.next {
                if responder.isKind(of: UIViewController.self){
                    return responder as? UIViewController
                }
            }
        }
        return nil
    }

}
