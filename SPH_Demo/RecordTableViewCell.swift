//
//  RecordTableViewCell.swift
//  SPH_Demo
//
//  Created by M.Y.A on 2020/7/3.
//  Copyright © 2020 M.Y.A. All rights reserved.
//

import UIKit

class RecordTableViewCell: UITableViewCell {
    
//    @IBOutlet weak var recordView: RecordView!
    
    var recordView: RecordView!
    
    var viewModel : RecordsViewModel!
       
    var recordViewModel : RecordsViewModel {
    
        set {
            self.viewModel = newValue
             let Q1 = (self.viewModel.Q1! as NSString).floatValue
             let Q2 = (self.viewModel.Q2! as NSString).floatValue
             let Q3 = (self.viewModel.Q3! as NSString).floatValue
             let Q4 = (self.viewModel.Q4! as NSString).floatValue
             self.recordView.createView(year: self.viewModel.year!, Q1: Q1, Q2: Q2, Q3: Q3, Q4: Q4)
        }

        get {
            return self.viewModel

        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        self.recordView = RecordView.init(frame: CGRect(x: 20, y: 0, width: FULL_SCREEN_WIDTH, height: 400))
        self.contentView.addSubview(recordView)

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
