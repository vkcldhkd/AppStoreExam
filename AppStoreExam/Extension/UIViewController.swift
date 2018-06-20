//
//  UIViewController.swift
//  AppStoreExam
//
//  Created by Sung Hyun on 2018. 6. 20..
//  Copyright © 2018년 Sung Hyun. All rights reserved.
//

import UIKit

extension UIViewController {
    /*
     * 스토리보드 이름과 뷰컨트롤러 이름으로 해당 뷰컨트롤러를 리턴받는 함수.
     * @param sbName,vcName
     * @Usage self.returnVC(sbName:sName,vcName:vName)
     * @returns UIViewController
     */
    func returnVC(sbName : String, vcName : String) -> UIViewController{
        let storyboard = UIStoryboard(name: sbName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: vcName)
    }
    
    /**
     * 뷰 타이틀 없애기
     * @param title
     * @Usage self.setViewControllerTitle(title : "asd")
     */
    
    func setViewControllerTitle(title : String){
        DispatchQueue.main.async {
            self.title = title
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
    }
    
    /**
     * Viewcontroller를 받아 네비게이션바로 푸시하기
     * @param vc
     * @Usage self.push(vc : detailVC)
     */
    func push(vc : UIViewController){
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
