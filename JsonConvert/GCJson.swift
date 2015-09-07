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
    
    class func toDicFromFile(filePath: String) -> NSDictionary? {
        if let dic = toJsonObj(filePath) as? NSDictionary {
            return dic
        }
        return nil
    }
    
    class func toArrayFromFile(filePath: String) -> NSArray? {
        if let array = toJsonObj(filePath) as? NSArray {
            return array
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
    
    private class func toJsonObj(filePath: String) -> AnyObject? {
        var error: NSError?
        if let json = NSString(contentsOfFile: filePath, encoding: NSUTF8StringEncoding, error: &error) as? String {
            if error != nil {
                println(error)
                return nil
            }
            
            let jsonData = json.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
            return toData(jsonData)
        }
        return nil
    }
    
}