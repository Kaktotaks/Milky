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

        myBackgroundView.addSubview(productImageView)
        productImageView.layer.cornerRadius = 35
        productImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.top.equalToSuperview().inset(20)
            make.width.equalTo(100)
            make.height.equalTo(200)
        }

    }

}
