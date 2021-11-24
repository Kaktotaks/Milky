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

    lazy var cartImage = UIImage(named: "cart")

    lazy var myBackgroundView: UIScrollView = {
        let myBackgroundView = UIScrollView()
        myBackgroundView.backgroundColor = .white
        return myBackgroundView
    }()

    lazy var productImageView: UIImageView = {
        let productImageView = UIImageView()
        productImageView.contentMode = .scaleAspectFill
        productImageView.clipsToBounds = true
        productImageView.layer.cornerRadius = 10
        return productImageView
    }()

    lazy var addtoBasketButton: UIButton = {
        let addtoBasket = UIButton()
        let image = UIImage(named: "add-to-basket") as UIImage?
        addtoBasket.setImage(image, for: .normal)
        addtoBasket.backgroundColor = UIColor(red: 103/255, green: 157/255, blue: 70/255, alpha: 0.50)
        addtoBasket.layer.cornerRadius = 15
        return addtoBasket
    }()
    
    lazy var productPriceImage: UIImageView = {
        let productPriceImage = UIImageView()
        productPriceImage.image = UIImage(named: "productPrice")
        productPriceImage.contentMode = .scaleAspectFill
        productPriceImage.alpha = 0.80
        return productPriceImage
    }()

    lazy var productPriceLabel: UILabel = {
        let productPriceLabel = UILabel()
        productPriceLabel.textColor = UIColor(red: 9/255, green: 120/255, blue: 40/255, alpha: 1)
        productPriceLabel.font = .systemFont(ofSize: 17, weight: .heavy)
        return productPriceLabel
    }()

    lazy var productInformationLabel: UILabel = {
        let productInformationLabel = UILabel()
        productInformationLabel.textColor = UIColor(red: 104/255, green: 70/255, blue: 47/255, alpha: 1)
        productInformationLabel.font = .systemFont(ofSize: 17, weight: .regular)
        productInformationLabel.numberOfLines = 0
        productInformationLabel.contentMode = .bottomLeft
        return productInformationLabel
    }()

    override func viewDidLoad() { super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: cartImage, style: .plain, target: self, action: nil)
        self.title = self.product?.productName
        configureDetailVC()
    }

    override func viewDidLayoutSubviews() { super.viewDidLayoutSubviews()
        setupConstraintsForProductDetailsVC()
    }

    func configureDetailVC() {
        let imageURL = URL(string: product?.productImageURL ?? "")
        self.productImageView.sd_setImage(with: imageURL, completed: nil)
        self.productPriceLabel.text = product?.productPrice
        self.productInformationLabel.text = product?.productInformation
    }
}
