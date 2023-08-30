//
//  SearchBarViewController.swift
//  Weather
//
//  Created by codes orbit on 28/08/2023.
//

import UIKit

@IBDesignable
class SearchBarView: UIView , UITextFieldDelegate{
    @IBOutlet weak var searchBar:UITextField!

    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
        self.configureView()
     }

     override init(frame: CGRect) {
         super.init(frame: frame)
         self.configureView()
     }
    
    func configureView() {
        guard let view = loadViewFromNib(nibName: "SearchBarView") else{return}
        view.frame = self.bounds
        self.addSubview(view)
        
        setupView()
     }
    
    func setupView() {
        searchBar.layer.borderColor = UIColor.black.cgColor
        searchBar.layer.borderWidth = 1.0
        searchBar.layer.cornerRadius = 15.0
//
////        searchBar.layer.shadowColor = UIColor.black.cgColor
////        searchBar.layer.shadowOffset = CGSize(width: 5, height: 5)
////        searchBar.layer.shadowRadius = 1
////        searchBar.layer.shadowOpacity = 0.4
        searchBar.layer.masksToBounds = true
        
        
//        searchBar.layer.borderWidth = 0.2
//        searchBar.layer.cornerRadius = 15.0
//        searchBar.layer.borderColor = UIColor.black.cgColor
//        searchBar.layer.shadowColor = UIColor.gray.cgColor
//        searchBar.layer.shadowOffset = CGSize(width: CGFloat(1.0), height: CGFloat(2.0))
//        searchBar.layer.shadowRadius = 1
//        searchBar.layer.shadowOpacity = 0.8
//        searchBar.layer.cornerRadius = 5.0
//        searchBar.layer.masksToBounds = false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("text field")
     }
}
