//
//  RecordView.swift
//  SPH_Demo
//
//  Created by M.Y.A on 2020/7/3.
//  Copyright © 2020 M.Y.A. All rights reserved.
//

import UIKit

class RecordView: UIView {
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    func createView(year: String, Q1 : Float, Q2 : Float, Q3 : Float, Q4 : Float) {
        
        let weightLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 30))

        weightLabel.text = "PB"
        weightLabel.textColor = UIColor.lightGray;
        weightLabel.font = UIFont.systemFont(ofSize: 12);
        weightLabel.textAlignment = NSTextAlignment.center;
        weightLabel.adjustsFontSizeToFitWidth = true
        addSubview(weightLabel)
                    
        let vierArray:NSArray = ["22","20","18","16","14","12","10","8","6","4","2","0"];
        for i:Int in 0 ..< vierArray.count {
            //纵坐标值
            let vLabel = UILabel(frame: CGRect(x: 0, y: 30+CGFloat(i)*30-15, width: 30, height: 30))
            vLabel.text = vierArray[i] as? String;
            vLabel.font = UIFont.systemFont(ofSize: 11);
            vLabel.textAlignment = NSTextAlignment.center;
            vLabel.adjustsFontSizeToFitWidth = true
            vLabel.textColor = UIColor.lightGray;
            addSubview(vLabel);
            
            //横坐标线
            let vLineV = UIView.init(frame: CGRect(x: 30, y: 30+30*CGFloat(i), width: 240, height: 1));
            if i==vierArray.count-1 {
                vLineV.backgroundColor = UIColor.black;
            } else {
                vLineV.backgroundColor = UIColor.lightGray;
            }
            addSubview(vLineV);
        }
                    
        let hierArray:Array = ["0","1","2","3","4","5","6","7","8"]
        for i:Int in 0 ..< hierArray.count {
            //横坐标值
            let hLabel = UILabel(frame: CGRect(x: 30*CGFloat(i)+15, y: 30*CGFloat(vierArray.count), width: 30, height: 30))
            if i%2 != 0 {
                var count = Int(hierArray[i])!
                count = Int((count + 1)/2)
                hLabel.text = "Q" + "\(count)"
            }
            hLabel.font = UIFont.systemFont(ofSize: 11);
            hLabel.textAlignment = NSTextAlignment.center;
            hLabel.adjustsFontSizeToFitWidth = true;
            hLabel.textColor = UIColor.lightGray;
            addSubview(hLabel)
            
            
            //纵坐标线
            let hLineV = UIView.init(frame: CGRect(x: 30+30*CGFloat(i), y: 30, width: 1, height: 30*CGFloat(vierArray.count)-30))
            if i==0 {
                hLineV.backgroundColor = UIColor.black;
            } else {
                hLineV.backgroundColor = UIColor.lightGray;
            }
            addSubview(hLineV);
        }
                    
        //年龄
      let ageLabel = UILabel(frame: CGRect(x: 270, y: 30*CGFloat(vierArray.count), width: 60, height: 30))
        ageLabel.text = "年份(\(year))";
        ageLabel.textColor = UIColor.lightGray;

        ageLabel.font = UIFont.systemFont(ofSize: 12);
        ageLabel.textAlignment = NSTextAlignment.right;
        ageLabel.adjustsFontSizeToFitWidth = true;
        addSubview(ageLabel);
                   
        //创建layer设置属性
        let layerR = CAShapeLayer.init();
        //设置包围的颜色，默认为黑色
        layerR.fillColor = UIColor.clear.cgColor;
        //折线宽度
        layerR.lineWidth = 1.0;
        //设置折线颜色
        layerR.strokeColor = UIColor.blue.cgColor;
        layer.addSublayer(layerR);
        
        //创建贝塞尔路径
        let pathH = UIBezierPath.init();
        //设置起点
        pathH.move(to: CGPoint(x: Int(self.getX(x: 1)), y: Int(getY(y: Q1))))
        //添加坐标点
        let xArray:NSArray = [self.getX(x: 1),self.getX(x: 3),getX(x: 5),getX(x: 7)];
        let yArray:NSArray = [getY(y: Q1),self.getY(y: Q2),getY(y: Q3),getY(y: Q4)];
        let data = [Q1, Q2, Q3,Q4]
        for i:Int in 1 ..< xArray.count {
            pathH.addLine(to:CGPoint(x: (xArray[i] as! CGFloat), y: (yArray[i] as! CGFloat)));
        }
        
        
        
        for i:Int in 0 ..< xArray.count {
            
            let newX = xArray[i] as! CGFloat
            let newY = yArray[i] as! CGFloat - 15
            
            let titleLabel = UILabel(frame: CGRect(x: CGFloat(newX), y: CGFloat(newY), width: 60, height: 30))
            titleLabel.text = "\(data[i])";
            titleLabel.textColor = UIColor.red;
            titleLabel.font = UIFont.systemFont(ofSize: 12);
            titleLabel.textAlignment = NSTextAlignment.left;
            titleLabel.adjustsFontSizeToFitWidth = true;
            addSubview(titleLabel);
        }
        
        
        
        layerR.path = pathH.cgPath;
        
        //创建基础动画,连接个点
        let animationN = CABasicAnimation.init(keyPath: "strokeEnd");
        //设置时间
        animationN.duration = 5;
        //添加动画
        layerR.add(animationN, forKey: nil)
            
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func getY(y: Float) -> Float {
        return 30 * 11 * (1-y/22) + 30

    }
    
    func getX(x: Float) -> Float {
        return Float(30+30*Float(x))
    }

   
}
