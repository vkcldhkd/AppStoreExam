//
//  UIImageView.swift
//  AppStoreExam
//
//  Created by Sung Hyun on 2018. 6. 20..
//  Copyright © 2018년 Sung Hyun. All rights reserved.
//

import UIKit

extension UIImageView{
    func downloadImage(urlString : String){
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { LogHelper.printLog(error!.localizedDescription); return }
            
//            LogHelper.printLog("다운로드 완료!!")
            DispatchQueue.main.async() {
                self.image = UIImage(data: data)
            }
            
            }.resume()
    }
}
