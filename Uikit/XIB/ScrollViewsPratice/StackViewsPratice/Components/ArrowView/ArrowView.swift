//
//  ArrowView.swift
//  StackViewsPratice
//
//  Created by codes orbit on 31/08/2023.
//

import UIKit
@IBDesignable
class ArrowView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialConfig()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialConfig()
    }

    override func prepareForInterfaceBuilder(){
        self.initialConfig()
      }
    override func draw(_ rect: CGRect){
        self.initialConfig()
    }
    let shapeLayer = CAShapeLayer()

    private var fillColor: UIColor = .black

    /// width percentage of space between view leading and edge leading
    ///
    /// The value should be between 0 and 100
    private var leadingEdgeWidthPercentage: Int8 = 20

    /// width percentage of space between view trailing and edge trailing
    ///
    /// The value should be between 0 and 100
    private var trailingEdgeWidthPercentage: Int8 = 20

    func initialConfig() {
        self.backgroundColor = .clear
        self.layer.addSublayer(self.shapeLayer)
        self.setup()
    }

    func setup(fillColor: UIColor? = nil,
               leadingPercentage: Int8? = nil,
               trailingPercentage: Int8? = nil) {

        if let fillColor = fillColor {
            self.fillColor = fillColor
        }

        if let leading = leadingPercentage,
            isValidPercentageRange(leading) {
            self.leadingEdgeWidthPercentage = leading
        }

        if let trailing = trailingPercentage,
            isValidPercentageRange(trailing) {
            self.trailingEdgeWidthPercentage = trailing
        }
    }

    private func changeShape() {
        self.shapeLayer.path = arrowShapePath().cgPath
        self.shapeLayer.fillColor = self.fillColor.cgColor
    }

    private func isValidPercentageRange(_ percentage: Int8) -> Bool {
        return 0 ... 100 ~= percentage
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        self.changeShape()
    }

    private func arrowShapePath() -> UIBezierPath {
        let size = self.bounds.size
        let leadingEdgeWidth = size.width * CGFloat(self.leadingEdgeWidthPercentage) / 100
        let trailingEdgeWidth = size.width * (1 - CGFloat(self.trailingEdgeWidthPercentage) / 100)

        let path = UIBezierPath()

        // move to zero point (top-right corner)
        path.move(to: CGPoint(x: 0, y: 0))

        // move to right inner edge point
        path.addLine(to: CGPoint(x: leadingEdgeWidth, y: size.height/2))

        // move to bottom-left corner
        path.addLine(to: CGPoint(x: 0, y: size.height))

        // move to bottom-right side
        path.addLine(to: CGPoint(x: trailingEdgeWidth, y: size.height))

        // move to left outer edge point
        path.addLine(to: CGPoint(x: size.width, y: size.height/2))

        // move to top-right side
        path.addLine(to: CGPoint(x: trailingEdgeWidth, y: 0))

        // close the path. This will create the last line automatically.
        path.close()

        return path
    }
}
