//
//  BasketVC.swift
//  Milky
//
//  Created by Леонід Шевченко on 24.11.2021.
//

import UIKit
import Firebase

class BasketVC: UIViewController {
    var products: [BasketProductsRealm] = []

     lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        return tableView
    }()

    lazy var clearButton: UIButton = {
       let clearButton = UIButton()
        let image = UIImage(named: "clear") as UIImage?
        clearButton.setImage(image, for: .normal)
        clearButton.addTarget(self, action: #selector(clearBasket), for: .touchUpInside)
        clearButton.backgroundColor = .red
        clearButton.layer.cornerRadius = 15
       return clearButton
   }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupConstraintsForBasketVC()

        tableView.delegate = self
        tableView.dataSource = self

        self.title = "🛒"

        self.tableView.register(ProductCustomTableViewCell.self, forCellReuseIdentifier: ProductCustomTableViewCell.identifier)
        view.addSubview(tableView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if FirebaseAuth.Auth.auth().currentUser != nil {
            self.products = self.getProducts()
            self.tableView.reloadData()
        } else {
            return
        }
    }

    private func getProducts() -> [BasketProductsRealm] {
        DataManager.shared.retrieveAllDataForObject(remoteObjects: products)
    }

    @objc func clearBasket() {
        DataManager.shared.realmTryDeleteAllObjects(products) {
            self.dismiss(animated: true, completion: nil)
        }
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
