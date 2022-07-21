//
//  MilksList.swift
//  Milky
//
//  Created by Леонід Шевченко on 11.11.2021.
//

import Foundation
import FirebaseAuth
import UIKit
import SnapKit
import SafariServices

class MilksListViewController: BaseViewController {
    private var products: [Product] = []
    private var filteredProducts = [Product]()
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()

   lazy var cartImage = UIImage(named: "cart")
   lazy var logoutImage = UIImage(named: "logout")

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(ProductCustomTableViewCell.self, forCellReuseIdentifier: ProductCustomTableViewCell.identifier)
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: logoutImage, style: .plain, target: self, action: #selector(logOutButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: cartImage, style: .plain, target: self, action: #selector(goToBasket))

        title = "Products"

        // Setup searchController
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    override func viewDidLayoutSubviews() {super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    @objc func logOutButtonTapped() {
        DataManager.shared.deleteAllObjectsWhileLogout {
            do {
            try FirebaseAuth.Auth.auth().signOut()
                self.dismiss(animated: true, completion: nil)
            } catch {
                print("An error occurred")
            }
        }
    }

    @objc func goToBasket(sender: UIButton!) {
        print("Basket tapped")

        let basketVC = UINavigationController(rootViewController: BasketVC())
        basketVC.modalTransitionStyle = .coverVertical
        present(basketVC, animated: true)
    }

}

extension MilksListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredProducts.count
        }
        return Products.productsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCustomTableViewCell.identifier) as?
                 ProductCustomTableViewCell else { return UITableViewCell() }
        if isFiltering {
            cell.configure(with: filteredProducts[indexPath.row])
        } else {
            cell.configure(with: Products.productsList[indexPath.row])

        }

        cell.delegate = self
        cell.tag = indexPath.row
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let identifier = String(describing: ProductDetailsVC.self)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(identifier: identifier) as? ProductDetailsVC {
            detailViewController.product = Products.productsList[indexPath.row]

            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}

extension MilksListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }

    // Appearing cells animation
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 150, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0
        UIView.animate(withDuration: 1.0) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
    }
}

// MARK: searchController config
extension MilksListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearch(searchController.searchBar.text ?? "")
    }
    private func filterContentForSearch(_ searchText: String) {
        filteredProducts = products.filter({ (product: Product) -> Bool in
            return product.productName.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}

extension MilksListViewController: CallForTapButtonDelegate {
    func buttonGoToWebTapped(tappedForItem item: Int) {
        print("Delegate is working ✌🏻")
        let object = Products.productsList[item]

        if let productsURL = URL(string: object.companyUrl) {
                let config = SFSafariViewController.Configuration()
                config.entersReaderIfAvailable = true

                let web = SFSafariViewController(url: productsURL, configuration: config)
                present(web, animated: true)
        }
    }

    func buttonAddToBasketTapped(tappedForItem item: Int) {
        let object = Products.productsList[item]

        if FirebaseAuth.Auth.auth().currentUser != nil {
            DataManager.shared.addRealmToBasket(object, completion: {
                self.showAlertProductAdded()
            })
        } else {
            self.showAlertToCreateAccount()
        }
    }
}
