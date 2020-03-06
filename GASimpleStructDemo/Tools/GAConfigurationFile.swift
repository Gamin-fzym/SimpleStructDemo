//
//  GAConfigurationFile.swift
//  GASimpleStructDemo
//
//  Created by Gamin on 2020/2/26.
//  Copyright © 2020 gamin.com. All rights reserved.
//

import UIKit
import Foundation

// 屏幕宽度
let SCREEN_WIDTH = UIScreen.main.bounds.size.width;
// 屏幕高度
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height;

// 状态栏高度
let STATUSBAR_HIGH = is_iPhoneXSeries() ? 44 : 20;

// 导航栏高度
let NAV_HIGH = 44;

// tabbar高度
let TABBAR_HEIGHT = is_iPhoneXSeries() ? 83.0 : 49.0;

// tabbar 安全区域的高度
let TABBAR_HEIGHT_SAFE = is_iPhoneXSeries() ? 34.0 : 0.0;


// AppDelegate
let APPDELEGATE = UIApplication.shared.delegate;

// Window
let KWINDOW = UIApplication.shared.delegate?.window;

// Default
let USER_DEFAULTS = UserDefaults.standard;

// 沙盒路径
let DOCUMENT_PATH = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true);

// 字符串是否为空
func is_URLString(ref: String) -> (Bool) {
    var result = false;
    if (!ref.isEmpty && (ref.hasPrefix("https://") || ref.hasPrefix("http://"))) {
        result = true;
    }
    return result;
}

// 字符串中是否包含某字符串
func StringContainsSubString(string: String, subString: String) -> (Bool) {
    let range = string.range(of: subString);
    if (range == nil) {
        return false;
    }
    return true;
}

// 十进制颜色
func RGBCOLOR(r: CGFloat, g: CGFloat, b: CGFloat) -> (UIColor) {
    return RGBACOLOR(r: r, g: g, b: b, a: 1.0);
}

func RGBACOLOR(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> (UIColor) {
    return UIColor(red: r, green: g, blue: b, alpha: a);
}

// 16进制颜色转UIColor
func HEXCOLOR(c: UInt64) -> (UIColor) {
    let redValue = CGFloat((c & 0xFF0000) >> 16)/255.0
    let greenValue = CGFloat((c & 0xFF00) >> 8)/255.0
    let blueValue = CGFloat(c & 0xFF)/255.0
    return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0);
}

// 字体
func FONTSIZE(size: CGFloat) -> (UIFont) {
    return UIFont.systemFont(ofSize: CGFloat(size));
}

// 加粗字体
func BOLDFONTSIZE(size: CGFloat) -> (UIFont) {
    return UIFont.boldSystemFont(ofSize: size);
}


// APPID
let APP_ID = "";

// iOS 11 以下的评价列表跳转
func APP_OPEN_EVALUATE() -> (String) {
    return "itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=" + APP_ID;
}

// iOS 11 的评价跳转
func APP_OPEN_EVALUATE_IOS11() -> (String) {
    return "itms-apps://itunes.apple.com/cn/app/id" + APP_ID + "?mt=8&action=write-review";
}

// 获取AppStore上对应APPID的应用信息
func APP_VERSION_INFO() -> (String) {
    return "https://itunes.apple.com/lookup?id=" + APP_ID;
}

// APP的下载链接
func APP_DOWNLOAD_URL() -> (String) {
    return "https://itunes.apple.com/app/id" + APP_ID;
}

/**
 布局转化
 round  如果参数是小数  则求本身的四舍五入.
 ceil   如果参数是小数  则求最小的整数但不小于本身.
 floor  如果参数是小数  则求最大的整数但不大于本身.
*/
func Adaptive_w_375(w: CGFloat) -> (CGFloat) {
    let new_width = round((w)*UIScreen.main.bounds.size.width/375.0);
    return new_width;
}


// 适配 判断系统版本
func AdaptiveiOSSystem(version: Float) -> (Bool) {
    let sysVer = Float(UIDevice.current.systemVersion) ?? 0.0;
    if (sysVer >= version) {
        return true;
    }
    return false;
}

// 判断是否设备是iphoneX系列
func is_iPhoneXSeries() -> (Bool) {
    let boundsSize = UIScreen.main.bounds.size;
    // iPhoneX,XS
    let x_xs = CGSize(width: 375, height: 812);
    if (__CGSizeEqualToSize(boundsSize, x_xs)) {
        return true;
    }
    // iPhoneXS Max,XR
    let xsmax_xr = CGSize(width: 414, height: 896);
    if (__CGSizeEqualToSize(boundsSize, xsmax_xr)) {
        return true;
    }
    return false;
}

// 判断iPhoneX
func is_iPhoneX() -> (Bool) {
    return CompareIPhoneSize(size: CGSize(width: 1125, height: 2436));
}

// 判断iPhoneXS
func is_iPhoneXS() -> (Bool) {
    return CompareIPhoneSize(size: CGSize(width: 1125, height: 2436));
}

// 判断iPHoneXR
func is_iPhoneXR() -> (Bool) {
    return CompareIPhoneSize(size: CGSize(width: 828, height: 1792));
}

// 判断iPhoneXS Max
func is_iPhoneXSMax() -> (Bool) {
    return CompareIPhoneSize(size: CGSize(width: 1242, height: 2688));
}

// 判断iPhone8 Plus
func is_iPhone8Plus() -> (Bool) {
    return CompareIPhoneSize(size: CGSize(width: 1080, height: 1920));
}

// 判断iPhone8
func is_iPhone8() -> (Bool) {
    return CompareIPhoneSize(size: CGSize(width: 750, height: 1334));
}

// 判断iPhone7 Plus
func is_iPhone7Plus() -> (Bool) {
    return CompareIPhoneSize(size: CGSize(width: 1080, height: 1920));
}

// 判断iPhone7
func is_iPhone7() -> (Bool) {
    return CompareIPhoneSize(size: CGSize(width: 750, height: 1334));
}

// 判断iPhone6S Plus
func is_iPhone6SPlus() -> (Bool) {
    return CompareIPhoneSize(size: CGSize(width: 1080, height: 1920));
}

// 判断iPhone6S
func is_iPhone6S() -> (Bool) {
    return CompareIPhoneSize(size: CGSize(width: 750, height: 1334));
}

// 设备是否是iPad
func is_iPad() -> (Bool) {
    if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad) {
        return true;
    }
    return false;
}

func CompareIPhoneSize(size: CGSize) -> (Bool) {
    if (!is_iPad()) {
        guard let currentSize = UIScreen.main.currentMode?.size else {
            return false;
        }
        if (__CGSizeEqualToSize(size, currentSize)) {
            return true;
        }
    }
    return false;
}
