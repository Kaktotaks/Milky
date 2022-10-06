//
//  ProductCustomTableViewCell.swift
//  Milky
//
//  Created by Леонід Шевченко on 19.11.2021.
//

import UIKit
import SnapKit
import SDWebImage

protocol CallForTapButtonDelegate {
    func buttonAddToBasketTapped(tappedForItem item: Int)
    func buttonGoToWebTapped(tappedForItem item: Int)
}

class ProductCustomTableViewCell: UITableViewCell {
    static let identifier = "ProductCustomTableViewCell"
    private var product: Product? = nil
    var delegate: CallForTapButtonDelegate?

    lazy var myBackgroundView: UIImageView = {
        let myBackgroundView = UIImageView()
        myBackgroundView.image = UIImage(named: "cloud")
        myBackgroundView.isUserInteractionEnabled = true
        return myBackgroundView
    }()

    private lazy var addtoBasketButton: UIButton = {
        let addtoBasket = UIButton()
        let image = UIImage(named: "add-to-basket") as UIImage?
        addtoBasket.setImage(image, for: .normal)
        addtoBasket.backgroundColor = ColorsManager.lightBlueColor
        addtoBasket.addTarget(self, action: #selector(addToBasket), for: .touchUpInside)
        addtoBasket.layer.cornerRadius = 15
        return addtoBasket
    }()

    @objc func addToBasket(tappedForItem item: Int) {
        self.delegate?.buttonAddToBasketTapped(tappedForItem: self.tag)
     }

    private lazy var goToWebButton: UIButton = {
        let goToWebButton = UIButton()
        let image = UIImage(named: "safari")
        goToWebButton.setImage(image, for: .normal)
        goToWebButton.backgroundColor = ColorsManager.lightBlueColor
        goToWebButton.addTarget(self, action: #selector(goToWeb), for: .touchUpInside)
        goToWebButton.layer.cornerRadius = 15
        return goToWebButton
    }()

    @objc func goToWeb(tappedForItem item: Int) {
        self.delegate?.buttonGoToWebTapped(tappedForItem: self.tag)
     }

    private lazy var productImageView: UIImageView = {
        let productImageView = UIImageView()
        productImageView.contentMode = .scaleAspectFill
        productImageView.clipsToBounds = true
        productImageView.layer.cornerRadius = 25
        return productImageView
    }()

    private lazy var productNameLabel: UILabel = {
        let productNameLabel = UILabel()
        productNameLabel.textColor = ColorsManager.brownTextColor
        productNameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        return productNameLabel
    }()

    private lazy var productInformationLabel: UILabel = {
        let productInformationLabel = UILabel()
        productInformationLabel.textColor = ColorsManager.brownTextColor
        productInformationLabel.font = .systemFont(ofSize: 17, weight: .regular)
        productInformationLabel.numberOfLines = 5
        productInformationLabel.contentMode = .bottomLeft
        return productInformationLabel
    }()

// MARK: Price
    private lazy var productPriceImage: UIImageView = {
        let productPriceImage = UIImageView()
        productPriceImage.image = UIImage(named: "productPrice")
        productPriceImage.contentMode = .scaleAspectFill
        productPriceImage.alpha = 0.80
        return productPriceImage
    }()

    private lazy var productPriceLabel: UILabel = {
        let productPriceLabel = UILabel()
        productPriceLabel.textColor = ColorsManager.greenColor
        productPriceLabel.font = .systemFont(ofSize: 17, weight: .heavy)
        return productPriceLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(myBackgroundView)
        myBackgroundView.addSubview(addtoBasketButton)
        myBackgroundView.addSubview(goToWebButton)
        myBackgroundView.addSubview(productNameLabel)
        myBackgroundView.addSubview(productImageView)
        myBackgroundView.addSubview(productInformationLabel)
        myBackgroundView.addSubview(productPriceImage)
        myBackgroundView.addSubview(productPriceLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        addtoBasketButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(15)
            make.width.height.equalTo(40)
        }

        goToWebButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.leading.equalToSuperview().inset(15)
            make.width.height.equalTo(40)
        }

        productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(myBackgroundView).inset(15)
            make.centerX.equalTo(myBackgroundView)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }

        productImageView.snp.makeConstraints { make in
            make.bottom.equalTo(myBackgroundView).inset(20)
            make.leading.equalTo(myBackgroundView).inset(40)
            make.width.equalTo(80)
            make.height.equalTo(myBackgroundView).inset(50)
        }

        myBackgroundView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview().inset(5)
        }
        myBackgroundView.layer.cornerRadius = 35

        productInformationLabel.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel).inset(30)
            make.leading.equalTo(productImageView).inset(100)
            make.trailing.equalTo(myBackgroundView).inset(10)
            make.bottom.equalTo(productPriceImage).inset(10)
        }

        productPriceImage.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(130)
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

    func configureRealm(with basketProductsRealm: BasketProductsRealm, imageURL: URL?) {
        self.productImageView.sd_setImage(with: imageURL, completed: nil)
        self.productNameLabel.text = basketProductsRealm.productName
        self.productInformationLabel.text = basketProductsRealm.productInformation
        self.productPriceLabel.text = basketProductsRealm.productPrice
    }
}
