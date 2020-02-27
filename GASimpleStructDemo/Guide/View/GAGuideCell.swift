//
//  GAGuideCell.swift
//  GASimpleStructDemo
//
//  Created by Gamin on 2020/2/25.
//  Copyright © 2020 gamin.com. All rights reserved.
//

import UIKit

class GAGuideCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var enterAppBut: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var cellModel: GAGuideModel? {
        didSet{
            imageView.image = UIImage(named: cellModel?.imgName ?? "");
        }
    }

    @IBAction func tapEnterAppAction(_ sender: Any) {
        guard let window = UIApplication.shared.delegate?.window else {
            return;
        }
        let tabbar = GARootTabBarController();
        window?.rootViewController = tabbar;
        
        let uDefault = UserDefaults.standard;
        uDefault.set("1", forKey: "openGuide");
        uDefault.synchronize();
    }
}
