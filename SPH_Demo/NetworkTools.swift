//
//  NetworkTools.swift
//  Swift_WB
//
//  Created by M.Y.A. on 2020/7/1.
//  Copyright © 2020 M.Y.A. All rights reserved.
//

import AFNetworking

enum MethodType {
    case GET
    case POST
}

class NetworkTools: AFHTTPSessionManager {
    // 线程安全
    static let shareInstance: NetworkTools = {
        let tools = NetworkTools()
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        tools.responseSerializer.acceptableContentTypes?.insert("text/plain")
        
        return tools
        
    }()
}

// MARK:- 封装请求方法
extension NetworkTools {
    func request(urlString: String, method: MethodType, parameters: [String : AnyObject]?, finished: @escaping(_ reslut: AnyObject?, _ error: Error?) -> ()) {
                
        let successCallBack = { (task: URLSessionDataTask , result: Any?) -> Void in
            finished(result as AnyObject?, nil)
        }
        
        let failureCallBack = { (task: URLSessionDataTask?, error: Error) -> Void in
            finished(nil, error)
        }
    
        
        
        if method == .GET {
            get(urlString, parameters: parameters, success:successCallBack, failure:failureCallBack)
        } else {
            
            post(urlString, parameters: parameters, success: successCallBack, failure: failureCallBack)
        }
        
    }
}

extension NetworkTools {
    // 请求token
        func loadData(finished: @escaping(_ reslut: [String: AnyObject]?, _ error: Error?) -> ()) {

    //        https://data.gov.sg/api/action/datastore_search?resource_id=a807b7ab-6cad-4aa6-87d0-e283a7353a0f&limit=5
            let urlString = "https://data.gov.sg/api/action/datastore_search?resource_id=a807b7ab-6cad-4aa6-87d0-e283a7353a0f&limit=59"
           
            request(urlString: urlString, method: .GET, parameters: nil) { (result, error) in

                finished(result as? [String : AnyObject], error)
            }
        }

}

