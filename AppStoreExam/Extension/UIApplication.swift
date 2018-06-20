//
//  UIApplication.swift
//  AppStoreExam
//
//  Created by Sung Hyun on 2018. 6. 20..
//  Copyright © 2018년 Sung Hyun. All rights reserved.
//

import UIKit
extension UIApplication {
    
    /*
     제일 상단의 뷰를 리턴해주는 함수.
     */
    func topViewController() -> UIViewController? {
        guard var topViewController = UIApplication.shared.keyWindow?.rootViewController else { return nil }
        
        while let presentedViewController = topViewController.presentedViewController {
            topViewController = presentedViewController
        }
        return topViewController
    }
    
}


