//
//  ProductDetailsVC.swift
//  Milky
//
//  Created by Леонід Шевченко on 23.11.2021.
//

import UIKit
import SDWebImage

class ProductDetailsVC: UIViewController {
var product: Product? = nil

    lazy var myBackgroundView: UIScrollView = {
        let myBackgroundView = UIScrollView()
        myBackgroundView.backgroundColor = .white
        return myBackgroundView
    }()

    lazy var productImageView: UIImageView = {
        let productImageView = UIImageView()
        productImageView.contentMode = .scaleAspectFill
        productImageView.clipsToBounds = true
        productImageView.layer.cornerRadius = 25
        return productImageView
    }()
    override func viewDidLoad() { super.viewDidLoad()
        setupConstraintsForProductDetailsVC()

        self.title = self.product?.productName
    }

    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
        configureDetailVC()
    }

    func configureDetailVC() {
        let imageURL = URL(string: product?.productImageURL ?? "")
        self.productImageView.sd_setImage(with: imageURL, completed: nil)
    }
}
