//
//  RequestManager.swift
//  AppStoreExam
//
//  Created by Sung Hyun on 2018. 6. 20..
//  Copyright © 2018년 Sung Hyun. All rights reserved.
//

import Foundation

class RequestManager {
    static fileprivate let queue = DispatchQueue(label: "requests.queue", qos: .utility)
    static fileprivate let mainQueue = DispatchQueue.main
    
    func getJsonFromUrl(url : String){
        //creating a NSURL
        guard let url = URL(string: url) else { return }
        
        //fetching the data from the url
        URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) -> Void in
            
            if let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? Dictionary<String,Any> {
                
                
                OperationQueue.main.addOperation({
                    
                })
            }
        }).resume()
    }
}
