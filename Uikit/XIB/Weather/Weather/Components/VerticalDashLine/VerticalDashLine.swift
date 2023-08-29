//
//  VerticalDashLine.swift
//  Weather
//
//  Created by codes orbit on 29/08/2023.
//

import UIKit
@IBDesignable
class VerticalDashLine: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
        self.configureView()
     }

     override init(frame: CGRect) {
         super.init(frame: frame)
         self.configureView()
     }
    
    func configureView() {
        guard let view = loadViewFromNib(nibName: "VerticalDashLine") else{return}
        view.frame = self.bounds
        self.addSubview(view)
        drawDottedLine(start: CGPoint(x: self.bounds.minX, y: self.bounds.minY), end: CGPoint(x: self.bounds.maxX, y: self.bounds.minY), view: self)

    }
    func drawDottedLine(start p0: CGPoint, end p1: CGPoint, view: UIView) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [7, 3] // 7 is the length of dash, 3 is length of the gap.

        let path = CGMutablePath()
        path.addLines(between: [p0, p1])
        shapeLayer.path = path
        view.layer.addSublayer(shapeLayer)
    }
}
