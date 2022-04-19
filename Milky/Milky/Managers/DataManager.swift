//
//  DataManager.swift
//  Milky
//
//  Created by Леонід Шевченко on 19.04.2022.
//

import Foundation
import RealmSwift

struct DataManager {
    let realm = try? Realm()

    static let shared = DataManager()

    private init() {}

    func addRealmToBasket(_ product: Product?, completion: @escaping(() -> Void)) {
        let productRealm = BasketProductsRealm()

        productRealm.productName = product?.productName ?? ""
        productRealm.productInformation = product?.productInformation ?? ""
        productRealm.productPrice = product?.productPrice ?? ""
        productRealm.companyUrl = product?.companyUrl ?? ""
        productRealm.productLikes = product?.productLikes ?? ""
        productRealm.productDislikes = product?.productDislikes ?? ""
        productRealm.productImageURL = product?.productImageURL ?? ""

        try? realm?.write {
            realm?.add(productRealm)
        }
        completion()
    }

    func getAllProducts() -> [BasketProductsRealm] {
        var products = [BasketProductsRealm]()
        guard let productsResults = realm?.objects(BasketProductsRealm.self) else { return [] }
        for product in productsResults {
            products.append(product)
        }
        return products
    }

    // MARK: Display realm object in a BasketVC DONE
    func retrieveAllDataForObject<T: Object>(remoteObjects: [T]) -> [T] {
        var realmObjct = [T]()
        guard let results = realm?.objects(T.self) else { return [] }
        for item in results {
            realmObjct.append(item)
        }
        return realmObjct
    }

    // MARK: Clear Database from Realm's objects (clear the basket)
    func realmTryDeleteAllObjects(_ objects: [Object], completion: @escaping(() -> Void)) {
        do {
            try realm?.write {
                realm?.delete(objects)
            }
        } catch {
            print("An error while realm try delete objects: \(error).")
        }
        completion()
    }

    // MARK: delete all products from basket while logout
    func deleteAllObjectsWhileLogout(completion: @escaping(() -> Void)) {
        do {
            // delete all products from basket
            guard
                let object = realm?.objects(BasketProductsRealm.self)
            else { return }
            try realm?.write {
                realm?.delete(object)
            }
            // logout from FireBase
            completion()
        } catch {
            print("An error occurred")
        }
    }
}
