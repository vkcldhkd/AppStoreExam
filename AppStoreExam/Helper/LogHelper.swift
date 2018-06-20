//
//  LogHelper.swift
//  AppStoreExam
//
//  Created by Sung Hyun on 2018. 6. 20..
//  Copyright © 2018년 Sung Hyun. All rights reserved.
//

import Foundation

/**
 * log를 찍어주기 위한 클래스와 함수
 * @param err,str,any,num
 * @Usage LogHelper.printLog(str: msg)
 */
class LogHelper {
    class func printLog(_ err: Error) {
        #if DEBUG
            print(err)
        #else
            
        #endif
    }
    
    class func printLog(_ str : String) {
        #if DEBUG
            print(str)
        #else
            
        #endif
    }
    
    class func printLog(_ any: AnyObject) {
        #if DEBUG
            print(any)
        #else
            
        #endif
    }
    class func printLog(_ num: Int) {
        #if DEBUG
            print(num)
        #else
            
        #endif
    }
}

