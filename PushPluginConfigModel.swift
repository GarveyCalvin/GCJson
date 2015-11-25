//
//  PushPluginConfigModel.swift
//  ManagerMobile
//
//  Created by jiaweibai on 15/11/25.
//
//

import Foundation

class PushPluginConfigModel {
    
    var app: String
    var group: String
    var uid: String
    var imei: String
    var type: String
    var version: String
    
    private init() {
        // Please use class method to create this class
    }
    
    class func standardDefault() -> PushPluginConfigModel {
        
        
        let config = PushPluginConfigModel()
        
    }
    
    /// Conver json string to NSDictionary from local file
    private class func toDicFromFile(filePath: String) -> NSDictionary? {
        if let dic = toJsonObj(filePath) as? NSDictionary {
            return dic
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
