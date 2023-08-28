//
//  ThirdViewController.swift
//  xibProject2
//
//  Created by codes orbit on 25/08/2023.
//

import UIKit

protocol ThirdViewControllerDelegate{
    func getData(data:FormModel)
}
class ThirdViewController: UIViewController {
    @IBOutlet weak var collectionView:UICollectionView!
    var items:[FormModel] = []
    var delegate:ThirdViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self        
        // Do any additional setup after loading the view.
    }
}

extension ThirdViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int{
        return self.items.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell{
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell{
            let item:FormModel = items[indexPath.item]
            cell.label?.text = "\(String(describing: item.username!)), \(String(describing: item.email!))"
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ){
        delegate?.getData(data: items[indexPath.row])
        navigationController?.popToRootViewController(animated: true)
    }
}


