//
//  Dictionary.swift
//  AppStoreExam
//
//  Created by Sung Hyun on 2018. 6. 20..
//  Copyright © 2018년 Sung Hyun. All rights reserved.
//

import Foundation

extension Dictionary {
    func jsonToString() -> String{
        do {
            let data =  try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
            return String(data: data, encoding: String.Encoding.utf8) ?? "defaultvalue"
            
        } catch let myJSONError {
            return myJSONError.localizedDescription
        }
    }
}
