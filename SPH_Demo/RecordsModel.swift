//
//  RecordsModel.swift
//  SPH_Demo
//
//  Created by 马滕亚 on 2020/7/2.
//  Copyright © 2020 M.Y.A. All rights reserved.
//

import UIKit

class RecordsModel: NSObject {
    
    
    @objc var volume_of_mobile_data : String?
        
    @objc var quarter : String?
    
    @objc var _id : Int = 0
    
    
    // 构造函数
    init(dic : [String : AnyObject]) {
        super.init()
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    // 重写 description属性
    override var description: String {
        return dictionaryWithValues(forKeys: ["volume_of_mobile_data","quarter"]).description
    }
    
}
