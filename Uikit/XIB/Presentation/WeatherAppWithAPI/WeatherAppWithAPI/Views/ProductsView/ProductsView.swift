//
//  ProductsView.swift
//  WeatherAppWithAPI
//
//  Created by codes orbit on 05/09/2023.
//

import UIKit

class ProductsView: UIViewController {
    
    var productsViewModel: ProductViewModel?
    @IBOutlet weak var productsTableView:UITableView!
    var productsList: [Product] = []
    var totalLengthOfProducts = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - setup view Model
        productsViewModel = ProductViewModel()
        productsViewModel?.delegate = self
        productsViewModel?.fetchProduts(limit: 10, skip: 10)
        //MARK: - Register Cell
        productsTableView.register(UINib(nibName: "ProductsTableCell", bundle: nil), forCellReuseIdentifier: ProductsTableCell.identifier)
        //MARK: -
        self.productsTableView.dataSource = self
        self.productsTableView.delegate = self
    }
}

//MARK: - Product View Model Delegate
extension ProductsView: ProductViewModelDelegate{
    func success(data: Products) {
        self.productsList += data.products
        self.totalLengthOfProducts = data.total
        self.productsTableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error)
    }
}

extension ProductsView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductsTableCell.identifier, for: indexPath) as? ProductsTableCell else{
            return UITableViewCell()
        }
        let title = productsList[indexPath.row].title
        let description =  productsList[indexPath.row].description
        cell.config(title: title, description: description,serialNumber:indexPath.row + 1)
        return cell
    }
    
    
}

extension ProductsView: UITableViewDelegate{
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ){
        print("row seletecd \(indexPath.row)")
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let row = indexPath.row + 1
        guard !productsList.isEmpty else { return }
        if productsList.count > row {
            return
        }
        if row >= totalLengthOfProducts{
            return
        }
        print(indexPath.row)
        productsViewModel?.fetchProduts(limit: 10, skip: row)
    }
}
