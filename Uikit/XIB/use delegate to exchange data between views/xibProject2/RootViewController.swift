//
//  RootViewController.swift
//  xibProject2
//
//  Created by codes orbit on 24/08/2023.
//

import UIKit

class RootViewController: UIViewController, ThirdViewControllerDelegate {

    @IBOutlet weak var username:UITextField!
    @IBOutlet weak var email:UITextField!
    private var data:[FormModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
//    override func viewWillAppear(_ animated: Bool){
//        super.viewWillAppear(animated)
//
//    }
    @IBAction func addToList(_ sender:Any){
        let formValue:FormModel = FormModel(username: username.text!, email: email.text!)
        
        if !find(findData: formValue){
            data.append(formValue)
            let secondViewController = SecondViewController(nibName: "SecondViewController", bundle: nil)
            secondViewController.items = data
            secondViewController.delegate = self
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }else{
            let alert = UIAlertController(title: "Alert", message: "User already exists", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }

    @IBAction func showCollectionView(_ sender: Any){
//        let thirdViewController = ThirdViewController(nibName: "ThirdViewController", bundle: nil)
//        thirdViewController.items = data
       let thirdViewController = ThirdViewController()
        thirdViewController.items = data
        thirdViewController.delegate = self
        self.navigationController?.pushViewController(thirdViewController, animated: true)
    }
    func find(findData:FormModel) -> Bool {
        for value in self.data{
            if value.username ==  findData.username || value.email == findData.email{
                return true
            }
        }
        return false
    }
}


extension RootViewController: SecondViewControllerDelegate{
    func getData(data: FormModel) {
        username.text = data.username
        email.text  = data.email
    }
}
