//
//  DataResponser.swift
//  AppStoreExam
//
//  Created by Sung Hyun on 2018. 6. 20..
//  Copyright © 2018년 Sung Hyun. All rights reserved.
//

import Foundation

class DataResponser{
    class func getFeedList(limit : Int = 100, closure: @escaping (Feed?)->()){
        RequestManager.request(url: Constants_api.GET_APPLE_FEEDS) { (json) in
            guard let dict = json,
                let model = try? FeedModel(dict.jsonToString()),
                let feed = model.feed else { closure(nil); return }
            
            //            LogHelper.printLog("feed : \(feed)")
            closure(feed)
            
        }
    }
    class func getDetailInfo(id : String, closure: @escaping (FeedDetailModel?)->()){
        RequestManager.request(url: Constants_api.GET_APPLE_FEED_DETAIL + "/lookup?id=\(id)&country=kr") { (json) in
            guard let dict = json,
                let model = try? FeedDetailModel(dict.jsonToString()) else { closure(nil); return }
            //            LogHelper.printLog(dict.jsonToString())
            closure(model)
        }
    }
}
