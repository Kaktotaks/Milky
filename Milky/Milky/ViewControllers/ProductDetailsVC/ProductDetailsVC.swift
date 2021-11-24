//
//  ProductDetailsVC.swift
//  Milky
//
//  Created by Леонід Шевченко on 23.11.2021.
//

import UIKit
import SDWebImage
import SafariServices

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
        addtoBasket.backgroundColor = productInformationLabel.backgroundColor
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
        productInformationLabel.contentMode = .scaleAspectFill
        productInformationLabel.backgroundColor = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 0.30)
        productInformationLabel.layer.cornerRadius = 15
        productInformationLabel.clipsToBounds = true
        return productInformationLabel
    }()

    lazy var likeButton: UIButton = {
        let likeButton = UIButton()
        let image = UIImage(named: "like") as UIImage?
        likeButton.setImage(image, for: .normal)
        likeButton.backgroundColor = UIColor(red: 103/255, green: 157/255, blue: 70/255, alpha: 0.50)
        likeButton.layer.cornerRadius = 15
        return likeButton
    }()

    lazy var dislikeButton: UIButton = {
        let dislikeButton = UIButton()
        let image = UIImage(named: "dislike") as UIImage?
        dislikeButton.setImage(image, for: .normal)
        dislikeButton.backgroundColor = UIColor(red: 254/255, green: 54/255, blue: 100/255, alpha: 0.50)
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
        safariButton.backgroundColor = productInformationLabel.backgroundColor
        safariButton.layer.cornerRadius = 15
        safariButton.addTarget(self, action: #selector(safariButtonPressed), for: .touchUpInside)
        return safariButton
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
        self.likesLabel.text = product?.productLikes
        self.dislikesLabel.text = product?.productDislikes
    }

    @objc func safariButtonPressed(sender: UIButton!) {
        if let productsURLString = self.product?.companyUrl {
            if let productsURL = URL(string: productsURLString){
                let config = SFSafariViewController.Configuration()
                config.entersReaderIfAvailable = true

                let web = SFSafariViewController(url: productsURL, configuration: config)
                present(web, animated: true)
            }
        }
    }
}
