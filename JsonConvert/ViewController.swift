//
//  ViewController.swift
//  JsonConvert
//
//  Created by 嘉伟白 on 15/7/27.
//  Copyright (c) 2015年 GarveyCalvin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let dic = ["modify": "true", "isOn": "false"]
        let array = ["modify", "true", "isOn", "false"]
        let jsonStr = GCJson.toJson(array)
        println(jsonStr)

        let dicOrArray = GCJson.toArray(jsonStr as! String)
        println(dicOrArray)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

