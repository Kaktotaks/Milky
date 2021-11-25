//
//  BasketVC.swift
//  Milky
//
//  Created by Леонід Шевченко on 24.11.2021.
//

import UIKit
import RealmSwift

class BasketVC: UIViewController {
    var products: [BasketProductsRealm] = []

    let realm = try? Realm()

     lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() { super.viewDidLoad()
        setupConstraintsForBasketVC()

        tableView.delegate = self
        tableView.dataSource = self

        self.title = "🛒"

        self.tableView.register(ProductCustomTableViewCell.self, forCellReuseIdentifier: ProductCustomTableViewCell.identifier)
        view.addSubview(tableView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.products = self.getProducts()
        self.tableView.reloadData()
    }

    private func getProducts() -> [BasketProductsRealm] {

        var products = [BasketProductsRealm]()
        guard let productsResults = realm?.objects(BasketProductsRealm.self) else { return [] }
        for product in productsResults {
            products.append(product)
        }
        return products
    }
}

// MARK: TableView extensions
extension BasketVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCustomTableViewCell.identifier) as? ProductCustomTableViewCell else { return UITableViewCell() }
        let productImageURLString = self.products[indexPath.row].productImageURL
        cell.configureRealm(with: products[indexPath.row], imageURL: URL(string: productImageURLString))

//        let productImageURLString = self.products[indexPath.row].productImageURL
//        cell.productImageConfigureWith(imageURL: URL(string: productImageURLString))
        return cell
    }

}

extension BasketVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            products.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
}
