//
//  GCJson.swift
//  JsonConvert
//
//  Created by 嘉伟白 on 15/7/27.
//  Copyright (c) 2015年 GarveyCalvin. All rights reserved.
//

import Foundation

class GCJson {
    
    // Convert NSDictionary or NSArray to JSON data from a Foundation object
    class func toJson(arrayOrDictionary: AnyObject) -> NSString? {
        if let array = arrayOrDictionary as? NSArray {
            println(array)
            
            var error: NSError?
            let jsonData = NSJSONSerialization.dataWithJSONObject(array, options: NSJSONWritingOptions.PrettyPrinted, error: &error)
            if error != nil {
                println(error)
                return nil
            }
            
            if let jsonData = jsonData {
                let json = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
                return json
            }
        }
        
        if let dictionary = arrayOrDictionary as? NSDictionary {
            println(dictionary)
            
            var error: NSError?
            let jsonData = NSJSONSerialization.dataWithJSONObject(dictionary, options: NSJSONWritingOptions.PrettyPrinted, error: &error)
            if error != nil {
                println(error)
                return nil
            }
            
            if let jsonData = jsonData {
                let json = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
                return json
            }
        }
        
        return nil
    }
    
    private class func toData(jsonData: NSData?) -> AnyObject? {
        if let jsonData = jsonData {
            var error: NSError?
            let dicOrArray: AnyObject? = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.AllowFragments, error: &error)
            if error != nil {
                println(error)
                return nil
            }
            
            return dicOrArray
        }
        
        return nil
    }
    
    // Convert json string to NSDictionary
    class func toDic(jsonString: String) -> NSDictionary? {
        let jsonData = jsonString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        if let dictionary = toData(jsonData) as? NSDictionary {
            return dictionary
        }
        
        return nil
    }
    
    // Convert json string to NSArray
    class func toArray(jsonString: String) -> NSArray? {
        let jsonData = jsonString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        if let array = toData(jsonData) as? NSArray {
            return array
        }
        
        return nil
    }
    
}