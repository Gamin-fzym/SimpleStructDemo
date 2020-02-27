//
//  GAConfigurationFile.swift
//  GASimpleStructDemo
//
//  Created by Gamin on 2020/2/26.
//  Copyright © 2020 gamin.com. All rights reserved.
//

import UIKit
import Foundation

//class GAConfigurationFile: NSObject {
// 屏幕宽度
let SCREEN_WIDTH = UIScreen.main.bounds.size.width;
// 屏幕高度
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height;

// 状态栏高度
let DE_STATUSBAR_HIGH = isIphoneX() ? 44 : 20;
// 导航栏高度
let DE_NAV_HIGH = isIphoneX() ? 44 : 44;

// 判断是否设备是iphonex系列
func isIphoneX() -> (Bool) {
    // iPhoneX,XS
    if (UIScreen.main.bounds.size.width == 375 && UIScreen.main.bounds.size.height == 812) {
        return true;
    }
    // iPhoneXS Max,XR
    if (UIScreen.main.bounds.size.width == 414 && UIScreen.main.bounds.size.height == 896) {
        return true;
    }
    return false;
}

// 16进制颜色转UIColor
func HEXCOLOR(c: UInt64) -> (UIColor) {
    let redValue = CGFloat((c & 0xFF0000) >> 16)/255.0
    let greenValue = CGFloat((c & 0xFF00) >> 8)/255.0
    let blueValue = CGFloat(c & 0xFF)/255.0
    return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0);
}

    
//}
