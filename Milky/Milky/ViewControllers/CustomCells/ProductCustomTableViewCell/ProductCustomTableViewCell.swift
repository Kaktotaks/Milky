//
//  ProductCustomTableViewCell.swift
//  Milky
//
//  Created by Леонід Шевченко on 19.11.2021.
//

import UIKit
import SnapKit

class ProductCustomTableViewCell: UITableViewCell {
    static let identifier = "ProductCustomTableViewCell"

    lazy var myBackgroundView: UIView = {
        let myBackgroundView = UIView()
        myBackgroundView.backgroundColor = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 0.30)
        return myBackgroundView
    }()

    lazy var productSwitch: UISwitch = {
        let productSwitch = UISwitch()
        productSwitch.tintColor = .blue
        productSwitch.isOn = false
        return productSwitch
    }()

    lazy var productImageView: UIImageView = {
        let productImageView = UIImageView()
        productImageView.image = UIImage(named: "milk1")
        productImageView.contentMode = .scaleAspectFill
        productImageView.clipsToBounds = true
        productImageView.layer.cornerRadius = 25
        return productImageView
    }()

    lazy var productNameLabel: UILabel = {
        let productNameLabel = UILabel()
        productNameLabel.textColor = UIColor(red: 104/255, green: 70/255, blue: 47/255, alpha: 1)
        productNameLabel.font = .systemFont(ofSize: 22, weight: .bold)
        productNameLabel.text = "Milk"
        return productNameLabel
    }()

    lazy var productInformationLabel: UILabel = {
        let productInformationLabel = UILabel()
        productInformationLabel.textColor = UIColor(red: 104/255, green: 70/255, blue: 47/255, alpha: 1)
        productInformationLabel.font = .systemFont(ofSize: 17, weight: .regular)
        productInformationLabel.text = "Some short information about the product. Some short information about the product."
        productInformationLabel.numberOfLines = 0
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
        let productNameLabel = UILabel()
        productNameLabel.textColor = UIColor(red: 9/255, green: 120/255, blue: 40/255, alpha: 1)
        productNameLabel.font = .systemFont(ofSize: 17, weight: .heavy)
        productNameLabel.text = "1.75 $"
        return productNameLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) { super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(myBackgroundView)
        myBackgroundView.addSubview(productSwitch)
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

        productSwitch.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
        }

        productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(myBackgroundView).inset(10)
            make.centerX.equalTo(myBackgroundView)
            make.width.equalTo(60)
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
            make.leading.equalTo(productImageView).inset(150)
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
}
