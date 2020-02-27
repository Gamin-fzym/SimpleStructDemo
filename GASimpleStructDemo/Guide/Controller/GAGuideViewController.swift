//
//  GAGuideViewController.swift
//  GASimpleStructDemo
//
//  Created by Gamin on 2020/2/25.
//  Copyright © 2020 gamin.com. All rights reserved.
//

import UIKit

class GAGuideViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var jumpBut: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    var dataMArr: [GAGuideModel] = [];
    var limitTime: Int = 5+1;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI();
        moniDataAction();
        startCountDown();
    }
 
    func setupUI() {
        // 纯代码的cell
        // collectionView.register(GAGuideCell.self, forCellWithReuseIdentifier: "GAGuideCell");
        // xib的cell
        collectionView.register(UINib(nibName: "GAGuideCell", bundle: nil), forCellWithReuseIdentifier: "cellId");
    }
    
    func moniDataAction() -> () {
        for i in 0..<5 {
            let model = GAGuideModel();
            model.name = "\(i)";
            model.imgName = "guide" + "\(i)" + ".jpg";
            dataMArr.append(model);
        }
        pageControl.numberOfPages = dataMArr.count;
        pageControl.currentPage = 0;
        collectionView.reloadData();
    }
    
    // MARK: 记时跳过
    
    @IBAction func tapJumpAction(_ sender: Any) {
        let but = sender as! UIButton;
        let text = but.titleLabel?.text ?? "";
        if (text == "跳过") {
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
    
    func startCountDown() {
        performSelector(inBackground: #selector(timerThread), with: nil)
    }
    
    @objc func timerThread() {
        let timeCount = limitTime
        for _ in 0..<timeCount {
            limitTime = limitTime - 1
            self.performSelector(onMainThread: #selector(updateJumpBtn), with: self, waitUntilDone: true)
            sleep(1)
        }
    }
    
    @objc func updateJumpBtn() {
        if (limitTime <= 0) {
            jumpBut.setTitle("跳过", for: .normal);
        } else {
            jumpBut.setTitle("跳过" + "(\(limitTime)S)", for: .normal);
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataMArr.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: GAGuideCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! GAGuideCell ;
        if (dataMArr.count > indexPath.row) {
            cell.cellModel = dataMArr[indexPath.row];
        } else {
            cell.cellModel = nil;
        }
        if (indexPath.row+1 == dataMArr.count) {
            cell.enterAppBut.isHidden = false;
        } else {
            cell.enterAppBut.isHidden = true;
        }
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / SCREEN_WIDTH);
        pageControl.currentPage = index;
    }
    
    // 定义每一个cell的大小
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath:IndexPath) ->CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height:  UIScreen.main.bounds.size.height);
    }
    
    // 定义每个Section的四边间距
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, insetForSectionAt section:Int) ->UIEdgeInsets {
        return UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0);
    }

    // 两行cell之间的间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
    
    // 两列cell之间的间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
    
}
