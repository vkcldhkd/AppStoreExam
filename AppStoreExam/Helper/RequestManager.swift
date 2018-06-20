//
//  RequestManager.swift
//  AppStoreExam
//
//  Created by Sung Hyun on 2018. 6. 20..
//  Copyright © 2018년 Sung Hyun. All rights reserved.
//

import Foundation

class RequestManager {
    
    /**
     * url로 부터 json을 받아오는 함수
     * closure를 통해 json,nil 혹은 nil,error을 반환
     */
    class func request(url : String, closure: @escaping (_ json: [String: Any]?)->()){
        guard let url = URL(string: url) else { return }
        
        //fetching the data from the url
        URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) -> Void in
            
            guard let data = data, error == nil else { LogHelper.printLog(error!.localizedDescription); return }
            
//            LogHelper.printLog("data : \(data)")
//            LogHelper.printLog("response : \(response)" )
            
            
            // JSONSerialization이 성공하면 json을, 아니면 nil을 반환
            guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String,Any> else { DispatchQueue.main.async { closure(nil) }; return }
            
            DispatchQueue.main.async { closure(json) }
            
        }).resume()
    }
}
