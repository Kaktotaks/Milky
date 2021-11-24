//
//  ProductCustomTableViewCell.swift
//  Milky
//
//  Created by Леонід Шевченко on 19.11.2021.
//

import UIKit
import SnapKit
import os
import SDWebImage

class ProductCustomTableViewCell: UITableViewCell {
    static let identifier = "ProductCustomTableViewCell"

    lazy var myBackgroundView: UIView = {
        let myBackgroundView = UIView()
        myBackgroundView.backgroundColor = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 0.30)
        return myBackgroundView
    }()

    lazy var addtoBasketButton: UIButton = {
        let addtoBasket = UIButton()
        let image = UIImage(named: "add-to-basket") as UIImage?
        addtoBasket.setImage(image, for: .normal)
        addtoBasket.backgroundColor = UIColor(red: 103/255, green: 157/255, blue: 70/255, alpha: 0.50)
        addtoBasket.layer.cornerRadius = 15
        return addtoBasket
    }()

    lazy var productImageView: UIImageView = {
        let productImageView = UIImageView()
        productImageView.contentMode = .scaleAspectFill
        productImageView.clipsToBounds = true
        productImageView.layer.cornerRadius = 25
        return productImageView
    }()

    lazy var productNameLabel: UILabel = {
        let productNameLabel = UILabel()
        productNameLabel.textColor = UIColor(red: 104/255, green: 70/255, blue: 47/255, alpha: 1)
        productNameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        return productNameLabel
    }()

    lazy var productInformationLabel: UILabel = {
        let productInformationLabel = UILabel()
        productInformationLabel.textColor = UIColor(red: 104/255, green: 70/255, blue: 47/255, alpha: 1)
        productInformationLabel.font = .systemFont(ofSize: 17, weight: .regular)
        productInformationLabel.numberOfLines = 5
        productInformationLabel.contentMode = .bottomLeft
        return productInformationLabel
    }()

// MARK: Price
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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) { super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(myBackgroundView)
        myBackgroundView.addSubview(addtoBasketButton)
        myBackgroundView.addSubview(productNameLabel)
        myBackgroundView.addSubview(productImageView)
        myBackgroundView.addSubview(productInformationLabel)
        myBackgroundView.addSubview(productPriceImage)
        myBackgroundView.addSubview(productPriceLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() { super.layoutSubviews()

        addtoBasketButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(15)
        }

        productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(myBackgroundView).inset(15)
            make.centerX.equalTo(myBackgroundView)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }

        productImageView.snp.makeConstraints { make in
            make.top.bottom.leading.equalTo(myBackgroundView).inset(10)
            make.width.equalTo(120)
            make.height.equalTo(myBackgroundView).inset(10)
        }

        myBackgroundView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview().inset(5)
        }
        myBackgroundView.layer.cornerRadius = 35

        productInformationLabel.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel).inset(30)
            make.leading.equalTo(productImageView).inset(135)
            make.trailing.equalTo(myBackgroundView).inset(10)
            make.bottom.equalTo(productPriceImage).inset(10)
        }

        productPriceImage.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(10)
            make.width.equalTo(50)
            make.height.equalTo(20)
        }

        productPriceLabel.snp.makeConstraints { make in
            make.trailing.equalTo(productPriceImage)
            make.bottom.equalToSuperview().inset(20)
            make.height.equalTo(20)
        }
    }

    func configure(with product: Product) {
        let imageURL = URL(string: product.productImageURL ?? "")
        self.productImageView.sd_setImage(with: imageURL, completed: nil)
        self.productNameLabel.text = product.productName
        self.productInformationLabel.text = product.productInformation
        self.productPriceLabel.text = product.productPrice
    }

    func configureRealm(with basketProductsRealm: BasketProductsRealm){
        self.productNameLabel.text = basketProductsRealm.productName
        self.productInformationLabel.text = basketProductsRealm.productInformation
        self.productPriceLabel.text = basketProductsRealm.productPrice
//    @objc dynamic var productImageURL: String = ""
    }
}
