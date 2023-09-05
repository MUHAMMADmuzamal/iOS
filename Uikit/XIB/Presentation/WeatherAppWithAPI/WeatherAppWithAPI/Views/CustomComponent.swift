//
//  CustomComponent.swift
//  WeatherAppWithAPI
//
//  Created by codes orbit on 04/09/2023.
//

import UIKit
@IBDesignable
class CustomComponent: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        print("in Custom component")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("in custom component")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
