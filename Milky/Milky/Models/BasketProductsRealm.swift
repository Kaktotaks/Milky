//
//  BasketProductsRealm.swift
//  Milky
//
//  Created by Леонід Шевченко on 24.11.2021.
//

import Foundation

import Foundation
import RealmSwift

class BasketProductsRealm: Object {
    @objc dynamic var productName: String = ""
    @objc dynamic var productInformation: String = ""
    @objc dynamic var productLikes: String = ""
    @objc dynamic var productDislikes: String = ""
    @objc dynamic var productImageURL: String = ""
    @objc dynamic var companyUrl: String = ""
    @objc dynamic var productPrice: String = ""
//    @objc dynamic var productID: Int = 0
}
