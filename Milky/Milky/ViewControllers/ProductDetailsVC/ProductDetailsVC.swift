//
//  ProductDetailsVC.swift
//  Milky
//
//  Created by Леонід Шевченко on 23.11.2021.
//

import UIKit
import SDWebImage
import SafariServices
import Firebase

class ProductDetailsVC: BaseViewController {
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
        addtoBasket.backgroundColor = ColorsManager.lightBlueColor
        addtoBasket.addTarget(self, action: #selector(addToBasketButtonPressed), for: .touchUpInside)
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
        productPriceLabel.textColor = ColorsManager.priceLabelColor
        productPriceLabel.font = .systemFont(ofSize: 17, weight: .heavy)
        return productPriceLabel
    }()

    lazy var productInformationLabel: UILabel = {
        let productInformationLabel = UILabel()
        productInformationLabel.textColor = ColorsManager.brownTextColor
        productInformationLabel.font = .systemFont(ofSize: 17, weight: .medium)
        productInformationLabel.numberOfLines = 0
        productInformationLabel.contentMode = .center
        return productInformationLabel
    }()

    lazy var likeButton: UIButton = {
        let likeButton = UIButton()
        let image = UIImage(named: "like") as UIImage?
        likeButton.setImage(image, for: .normal)
        likeButton.backgroundColor = ColorsManager.lightGreenColor
        likeButton.layer.cornerRadius = 15
        return likeButton
    }()

    lazy var dislikeButton: UIButton = {
        let dislikeButton = UIButton()
        let image = UIImage(named: "dislike") as UIImage?
        dislikeButton.setImage(image, for: .normal)
        dislikeButton.backgroundColor = ColorsManager.lightRedColor
        dislikeButton.layer.cornerRadius = 15
        return dislikeButton
    }()

    lazy var likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.textColor = likeButton.backgroundColor
        likesLabel.font = .systemFont(ofSize: 17, weight: .heavy)
        return likesLabel
    }()

    lazy var dislikesLabel: UILabel = {
        let dislikesLabel = UILabel()
        dislikesLabel.textColor = dislikeButton.backgroundColor
        dislikesLabel.font = .systemFont(ofSize: 17, weight: .heavy)
        return dislikesLabel
    }()

    lazy var safariButton: UIButton = {
        let safariButton = UIButton()
        let image = UIImage(named: "safari") as UIImage?
        safariButton.setImage(image, for: .normal)
        safariButton.backgroundColor = ColorsManager.lightBlueColor
        safariButton.layer.cornerRadius = 15
        safariButton.addTarget(self, action: #selector(safariButtonPressed), for: .touchUpInside)
        return safariButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: cartImage, style: .plain, target: self, action: #selector(goToBasket))
        self.title = self.product?.productName
        configureDetailVC()
    }

    @objc func goToBasket(sender: UIButton!) {
        print("Basket tapped")

        let basketVC = UINavigationController(rootViewController: BasketVC())
        basketVC.modalTransitionStyle = .coverVertical
        present(basketVC, animated: true)
    }

    override func viewDidLayoutSubviews() { super.viewDidLayoutSubviews()
        setupConstraintsForProductDetailsVC()
    }

    func configureDetailVC() {
        let imageURL = URL(string: product?.productImageURL ?? "")
        self.productImageView.sd_setImage(with: imageURL, completed: nil)
        self.productPriceLabel.text = product?.productPrice
        self.productInformationLabel.text = product?.productInformation
        self.likesLabel.text = product?.productLikes
        self.dislikesLabel.text = product?.productDislikes
    }

    @objc func addToBasketButtonPressed(_ sender: Any) {
        if FirebaseAuth.Auth.auth().currentUser != nil {
            DataManager.shared.addRealmToBasket(product, completion: {
                self.showAlertProductAdded()
            })
        } else {
            self.showAlertToCreateAccount()
        }
    }

    @objc func safariButtonPressed(sender: UIButton!) {
        if let productsURLString = self.product?.companyUrl {
            if let productsURL = URL(string: productsURLString) {
                let config = SFSafariViewController.Configuration()
                config.entersReaderIfAvailable = true

                let web = SFSafariViewController(url: productsURL, configuration: config)
                present(web, animated: true)
            }
        }
    }
}
