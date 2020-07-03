//
//  RecordsViewModel.swift
//  SPH_Demo
//
//  Created by 马滕亚 on 2020/7/3.
//  Copyright © 2020 M.Y.A. All rights reserved.
//

import UIKit

class RecordsViewModel: NSObject {
        
//     var recordModelArr : [[String: AnyObject]]?
    var recordModelArr : [RecordsModel]?

    
     var year : String?
    
     var Q1 : String?
    
     var Q2 : String?
    
     var Q3 : String?
    
     var Q4 : String?
    
    var isRrowthR : Bool?
    
    init(recordModelArr : [RecordsModel]) {
        self.recordModelArr = recordModelArr
        var arr = Array<Any>()
        for item in recordModelArr {
            let year = item.quarter?.components(separatedBy: "-").first!
            self.year = year
            arr.append(item.volume_of_mobile_data ?? 0)
        }
        self.Q1 = arr[0] as? String
        self.Q2 = arr[1] as? String
        self.Q3 = arr[2] as? String
        self.Q4 = arr[3] as? String
    }
    
    
    
}
