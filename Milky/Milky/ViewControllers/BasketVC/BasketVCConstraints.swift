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
        tableView.frame = view.bounds
    }
}
