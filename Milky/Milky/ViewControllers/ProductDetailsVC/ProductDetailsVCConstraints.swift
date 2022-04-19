//
//  ProductDetailsVCConstraints.swift
//  Milky
//
//  Created by Леонід Шевченко on 23.11.2021.
//

import Foundation
import SnapKit
import UIKit

extension ProductDetailsVC {
    func setupConstraintsForProductDetailsVC() {
        view.addSubview(myBackgroundView)
        myBackgroundView.frame = view.bounds
        myBackgroundView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height)

        myBackgroundView.addSubview(productImageView)
        productImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(myBackgroundView).inset(100)
            make.width.equalTo(100)
            make.height.equalTo(240)
        }

        myBackgroundView.addSubview(addtoBasketButton)
        addtoBasketButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(productImageView).inset(250)
            make.width.height.equalTo(50)
        }

        myBackgroundView.addSubview(productPriceImage)
        productPriceImage.snp.makeConstraints { make in
            make.top.equalTo(productImageView).inset(20)
            make.trailing.equalTo(productImageView).inset(-50)
            make.width.equalTo(50)
            make.height.equalTo(20)
        }

        myBackgroundView.addSubview(productPriceLabel)
        productPriceLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(productPriceImage)
        }

        myBackgroundView.addSubview(productInformationLabel)
        productInformationLabel.snp.makeConstraints { make in
            make.top.equalTo(productPriceLabel).inset(300)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(30)
        }

        myBackgroundView.addSubview(likeButton)
        likeButton.snp.makeConstraints { make in
            make.top.equalTo(productImageView).inset(20)
            make.leading.equalToSuperview().inset(20)
            make.width.equalTo(30)
            make.height.equalTo(50)
        }

        myBackgroundView.addSubview(dislikeButton)
        dislikeButton.snp.makeConstraints { make in
            make.top.equalTo(likeButton).inset(70)
            make.leading.equalToSuperview().inset(20)
            make.width.equalTo(30)
            make.height.equalTo(50)
        }

        myBackgroundView.addSubview(likesLabel)
        likesLabel.snp.makeConstraints { make in
            make.centerY.equalTo(likeButton)
            make.leading.equalTo(likeButton).inset(40)
        }

        myBackgroundView.addSubview(dislikesLabel)
        dislikesLabel.snp.makeConstraints { make in
            make.centerY.equalTo(dislikeButton)
            make.leading.equalTo(dislikeButton).inset(40)
        }

        myBackgroundView.addSubview(safariButton)
        safariButton.snp.makeConstraints { make in
            make.top.equalTo(productInformationLabel).inset(300)
            make.centerX.equalToSuperview()
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
    }
}
