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
import RealmSwift

class MilksListViewController: UIViewController {
    private var products: [Product] = []
    let realm = try? Realm()

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
    }

    override func viewDidLayoutSubviews() {super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    @objc func logOutButtonTapped() {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            dismiss(animated: true, completion: nil)
        } catch {
            print("An error occurred")
        }
    }

    @objc func goToBasket(sender: UIButton!) {
        print("Basket tapped")

        let basketVC = UINavigationController(rootViewController: BasketVC())
//        basketVC.modalPresentationStyle = .fullScreen
        basketVC.modalTransitionStyle = .coverVertical
        present(basketVC, animated: true)
    }

}

extension MilksListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Products.productsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCustomTableViewCell.identifier) as?
                 ProductCustomTableViewCell else { return UITableViewCell() }
        cell.configure(with: Products.productsList[indexPath.row])

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
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 30, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0
        UIView.animate(withDuration: 0.75) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
    }
}
