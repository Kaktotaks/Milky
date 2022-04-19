//
//  BasketVCConstraints.swift
//  Milky
//
//  Created by Леонід Шевченко on 25.11.2021.
//

import Foundation
import SnapKit
import UIKit

extension BasketVC {
    func setupConstraintsForBasketVC() {
        view.addSubview(tableView)
        view.addSubview(clearButton)

            clearButton.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalToSuperview().inset(70)
                make.width.equalTo(50)
                make.height.equalTo(50)
            }

            tableView.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(150)
                make.left.right.bottom.equalToSuperview()
            }
    }
}
