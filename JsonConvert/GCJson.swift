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
            if let jsonData = dataWithJsonObject(array) {
                let json = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
                return json
            }
        }
    
        if let dictionary = arrayOrDictionary as? NSDictionary {
            if let jsonData = dataWithJsonObject(dictionary) {
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
    
    /// Conver json string to NSDictionary from local file
    class func toDicFromFile(filePath: String) -> NSDictionary? {
        if let dic = toJsonObj(filePath) as? NSDictionary {
            return dic
        }
        return nil
    }
    
    /// Conver json string to NSArray from local file
    class func toArrayFromFile(filePath: String) -> NSArray? {
        if let array = toJsonObj(filePath) as? NSArray {
            return array
        }
        return nil
    }
    
    
    
    // MARK: - Private method
    
    private class func dataWithJsonObject(obj: AnyObject) -> NSData? {
        do {
            let data = try NSJSONSerialization.dataWithJSONObject(obj, options: NSJSONWritingOptions.PrettyPrinted)
            return data
        } catch let error as NSError {
            print(error)
            return nil
        }
    }
    
    private class func jsonObjectWithData(jsonData: NSData) -> AnyObject? {
        do {
            let dicOrArray = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.AllowFragments)
            return dicOrArray
        } catch let error as NSError {
            print(error)
            return nil
        }
    }
    
    private class func toData(jsonData: NSData?) -> AnyObject? {
        if let jsonData = jsonData {
            let dicOrArray = jsonObjectWithData(jsonData)
            return dicOrArray
        }
        
        return nil
    }
    
    private class func toJsonObj(filePath: String) -> AnyObject? {
        do {
            let json = try NSString(contentsOfFile: filePath, encoding: NSUTF8StringEncoding)
            let jsonData = json.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
            return toData(jsonData)
        } catch let error as NSError {
            print(error)
            return nil
        }
    }
    
}