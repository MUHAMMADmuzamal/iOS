//
//  ViewController.swift
//  AlamofireTest
//
//  Created by codes orbit on 21/08/2023.
//

import UIKit
import Alamofire

class ReminderListViewController: UICollectionViewController {
    
    
    
    var dataSource:DataSoucre!
    var reminders:[Reminder] = Reminder.sampleData
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let listlayout = listLayout()
        collectionView.collectionViewLayout = listlayout

        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSource = DataSoucre(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Reminder.ID) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath,item: itemIdentifier)
        }
        
        updateSnapshot()
        collectionView.dataSource = dataSource
//        AF.request("https://www.httpbin.org/get").response{ response in
//            debugPrint(response)
//        }
    }
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath
        ) -> Bool {
            let id = reminders[indexPath.item].id
            pushDetailViewForReminder(withId: id)
            return false
        }


    func pushDetailViewForReminder(withId id: Reminder.ID) {
        let reminder = reminder(withId: id)
        let viewController = ReminderViewController(reminder: reminder)
        navigationController?.pushViewController(viewController, animated: true)
    }
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
    

}

