//
//  ViewController.swift
//  JsonConvert
//
//  Created by 嘉伟白 on 15/7/27.
//  Copyright (c) 2015年 GarveyCalvin. All rights reserved.
//

import UIKit
import GCJson

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let file = NSBundle.mainBundle().pathForResource("test", ofType: "geojson") {            
            let dic = GCJson.toDicFromFile(file)
            print(dic)
            if let string = dic?["type"] as? String {
                let response = GCJson.toDic(string)
                print(response)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

