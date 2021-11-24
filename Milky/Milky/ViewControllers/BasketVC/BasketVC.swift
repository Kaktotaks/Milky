//
//  BasketVC.swift
//  Milky
//
//  Created by Леонід Шевченко on 24.11.2021.
//

import UIKit
import RealmSwift

class BasketVC: UIViewController {
    lazy var products: [BasketProductsRealm] = []

    let realm = try? Realm()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProductCustomTableViewCell.self, forCellReuseIdentifier: ProductCustomTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self

        self.title = "Basket 🐮"

        self.tableView.register(UINib(nibName: ProductCustomTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ProductCustomTableViewCell.identifier)
    }

    override func viewDidLayoutSubviews() {super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
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
        cell.configureRealm(with: products[indexPath.row])
        return cell
    }

}

extension BasketVC: UITableViewDelegate {
    // Appearing cells animation
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 50, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0
        UIView.animate(withDuration: 0.75) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
    }

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
}
