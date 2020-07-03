//
//  ViewController.swift
//  SPH_Demo
//
//  Created by M.Y.A. on 2020/7/2.
//  Copyright © 2020 M.Y.A. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //    private lazy var dataArr : [StatusModel] = [StatusModel]()

    private lazy var dataArr : Array = Array<Any>()
    
    private lazy var tableView : UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        

        
        tableView.frame = self.view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderHeight = 44
        tableView.register(RecordTableViewCell.self, forCellReuseIdentifier: "cellId")
        self.view.addSubview(tableView)
        
        loadData()
    }


}

// delegate
extension ViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let recordViewModel = self.dataArr[section] as! RecordsViewModel
        return "\(recordViewModel.year!)" + "年"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RecordTableViewCell(style: .default, reuseIdentifier: "cellId")
        let recordViewModel = self.dataArr[indexPath.section] as! RecordsViewModel
        cell.recordViewModel = recordViewModel
        return cell
    }
}

// MARK:- 请求数据
extension ViewController {
    func loadData() {
        NetworkTools.shareInstance.loadData { (result, error) in
            if error != nil {
                return
            }
            
            
            guard let resultNew = result?["result"] else {
                return
            }
            
            
            guard let records  = resultNew["records"] as? [[String: AnyObject]] else {
                return
            }
            
            
            var newArr = Array<Any>()
            for dic in records {
                let record = RecordsModel.init(dic: dic)
                if record._id > 14 && record._id < 59{
                    newArr.append(record)
                }
            }
            
           let size = 4
           let chunks = stride(from: 0, to: newArr.count, by: size).map {
               Array(newArr[$0..<min($0 + size, newArr.count)])
           }
            
        
            for chunksItem in chunks {
                guard let arr = chunksItem as? [RecordsModel] else {
                    return
                }
                
                let viewMolde = RecordsViewModel(recordModelArr: arr)
                self.dataArr.append(viewMolde)
            }
            self.tableView.reloadData()
            
            

        }
    }
}

