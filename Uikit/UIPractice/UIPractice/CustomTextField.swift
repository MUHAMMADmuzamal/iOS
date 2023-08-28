//
//  CustomTextField.swift
//  UIPractice
//
//  Created by codes orbit on 28/08/2023.
//

import UIKit
@IBDesignable
class CustomTextField: UITextField {

    override func prepareForInterfaceBuilder(){
        customView()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        customView()
        // Do any additional setup after loading the view.
    }
    func customView()  {
        backgroundColor = UIColor.green
    }
}
