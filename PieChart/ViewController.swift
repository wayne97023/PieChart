//
//  ViewController.swift
//  PieChart
//
//  Created by 林奇杰 on 2020/3/14.
//  Copyright © 2020 林奇杰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageChart: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        let aDegree = CGFloat.pi / 180  //  每度，也就是1度多少
        let lineWidth: CGFloat = 20     //  線條（內徑）寬度
        let radius: CGFloat = 75       //  圓心的距離
        let startDegree: CGFloat = 270  //  起點

        let circlePath = UIBezierPath(ovalIn: CGRect(x: lineWidth, y: lineWidth, width: radius*2, height: radius*2))
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.strokeColor = UIColor.gray.cgColor
        circleLayer.lineWidth = lineWidth
        circleLayer.fillColor = UIColor.clear.cgColor

        //畫進度條（分佈）
        func createTask(startDegree:CGFloat , percentage:CGFloat , color:UIColor) -> CAShapeLayer{
            let percentagePath = UIBezierPath(arcCenter: CGPoint(x: lineWidth + radius, y: lineWidth + radius), radius: radius, startAngle: aDegree * startDegree, endAngle: aDegree * (startDegree + 360 * percentage / 100), clockwise: true)
            let percentageLayer = CAShapeLayer()
            percentageLayer.path = percentagePath.cgPath
            percentageLayer.strokeColor  = color.cgColor
            percentageLayer.lineWidth = lineWidth
            percentageLayer.fillColor = UIColor.clear.cgColor
            return percentageLayer
        }
        
        //第一個證券
        let start1:CGFloat = 270
        let stock1: CGFloat = 26
        let color1: UIColor = UIColor(red: 64/255, green: 113/255, blue: 189/255 , alpha: 1)
        let percentageLayer = createTask(startDegree:start1,percentage: stock1 , color:color1)
        
        
        //第二個證券
        let start2:CGFloat = (270 + 360 * stock1 / 100)
        let stock2: CGFloat = 26
        let color2: UIColor = UIColor(red: 128/255, green: 208/255, blue: 218/255 , alpha: 1)
        let percentageLayer2 = createTask(startDegree:start2,percentage: stock2 , color:color2)
        
        
        //第三個證券
        let start3:CGFloat = (start2 + 360 * stock2 / 100)
        let stock3: CGFloat = 26
        let color3: UIColor = UIColor(red: 86/255, green: 171/255, blue: 147/255 , alpha: 1)
        let percentageLayer3 = createTask(startDegree:start3,percentage: stock3 , color:color3)
        
        
        //第四個證券
        let start4:CGFloat = (start3 + 360 * stock3 / 100)
        let stock4: CGFloat = 15
        let color4: UIColor = UIColor(red: 193/255, green: 233/255, blue: 252/255 , alpha: 1)
        let percentageLayer4 = createTask(startDegree:start4,percentage: stock4 , color:color4)
        
        
        //第五個證券
        let start5:CGFloat = (start4 + 360 * stock4 / 100)
        let stock5: CGFloat = 7
        let color5: UIColor = UIColor(red: 129/255, green: 212/255, blue: 159/255 , alpha: 1)
        let percentageLayer5 = createTask(startDegree:start5,percentage: stock5 , color:color5)
        
        
        //證券總金額
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 2 * (radius + lineWidth), height: 2 * (radius + lineWidth)))
        label.textAlignment = .center
        label.text = "NT$243,963,912"

        
        //加入至ImageView
        imageChart.layer.addSublayer(circleLayer)
        imageChart.layer.addSublayer(percentageLayer)
        imageChart.layer.addSublayer(percentageLayer2)
        imageChart.layer.addSublayer(percentageLayer3)
        imageChart.layer.addSublayer(percentageLayer4)
        imageChart.layer.addSublayer(percentageLayer5)
        imageChart.addSubview(label)

    }
    
}

