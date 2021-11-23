//
//  User.swift
//  Milky
//
//  Created by Леонід Шевченко on 11.11.2021.
//
import UIKit
// swiftlint:disable all
struct Products {
    static var productsList: [Product] = [Product(productName: "Milk 1",
                                                  productInformation: "Some short information about the product 1",
                                                  productLikes: "",
                                                  productDislikes: "",
                                                  productImageURL: "https://finedrinks.ru/wa-data/public/shop/products/97/08/897/images/2364/2364.750.jpeg",
                                                  companyUrl: "",
                                                  productPrice: "3.50 $"),
                                          Product(productName: "Milk 2",
                                                  productInformation: "Some short information about the product 2",
                                                  productLikes: "",
                                                  productDislikes: "",
                                                  productImageURL: "https://www.stonyfield.com/wp-content/uploads/2017/02/stonyfield-organic-milk-half-gallon-reduced-fat-500x500-1.png",
                                                  companyUrl: "",
                                                  productPrice: "4.30 $"),
                                          Product(productName: "Milk 3",
                                                  productInformation: "Some short information about the product 3",
                                                  productLikes: "",
                                                  productDislikes: "",
                                                  productImageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdMi6yDkeVAr0ILR4DOKZajpxo0de0-k2pBA&usqp=CAU",
                                                  companyUrl: "",
                                                  productPrice: "3.10 $"),
                                          Product(productName: "Milk 4",
                                                  productInformation: "",
                                                  productLikes: "",
                                                  productDislikes: "",
                                                  productImageURL: "https://www.letu.ru/common/img/uploaded/skuImageFolder/CLOR49018GT.jpg",
                                                  companyUrl: "",
                                                  productPrice: "2.50 $"),
                                          Product(productName: "Milk 5",
                                                  productInformation: "",
                                                  productLikes: "",
                                                  productDislikes: "",
                                                  productImageURL: "https://images.heb.com/is/image/HEBGrocery/000481244?fit=constrain,1&wid=800&hei=800&fmt=jpg&qlt=85,0&resMode=sharp2&op_usm=1.75,0.3,2,0",
                                                  companyUrl: "",
                                                  productPrice: "2.75 $"),
                                          Product(productName: "Milk 6",
                                                  productInformation: "",
                                                  productLikes: "",
                                                  productDislikes: "",
                                                  productImageURL: "https://www.stonyfield.com/wp-content/uploads/2017/02/stonyfield-organic-milk-half-gallon-reduced-fat-500x500-1.png",
                                                  companyUrl: "",
                                                  productPrice: "1.90 $"),
                                          Product(productName: "Milk 7",
                                                  productInformation: "",
                                                  productLikes: "",
                                                  productDislikes: "",
                                                  productImageURL: "https://www.dutchlady.com.my/wp-content/uploads/2020/09/full-cream-milk-sterilised-900ml.jpg",
                                                  companyUrl: "",
                                                  productPrice: "2.50 $"),
                                          Product(productName: "Milk 8",
                                                  productInformation: "",
                                                  productLikes: "",
                                                  productDislikes: "",
                                                  productImageURL: "https://www.dutchlady.com.my/wp-content/uploads/2020/09/fresh-milk-pasteurised-1l-1.jpg",
                                                  companyUrl: "",
                                                  productPrice: "3.20 $"),
                                          Product(productName: "Milk 9",
                                                  productInformation: "",
                                                  productLikes: "",
                                                  productDislikes: "",
                                                  productImageURL: "https://images.izi.ua/102364334",
                                                  companyUrl: "",
                                                  productPrice: "2.00 $"),
                                          Product(productName: "Milk 10",
                                                  productInformation: "",
                                                  productLikes: "",
                                                  productDislikes: "",
                                                  productImageURL: "https://assets.sainsburys-groceries.co.uk/gol/6770697/1/640x640.jpg",
                                                  companyUrl: "",
                                                  productPrice: "2.25 $")
    ]
}

struct Product {
    var productName: String
    var productInformation: String
    var productLikes: String
    var productDislikes: String
    var productImageURL: String?
    var companyUrl: String
    var productPrice: String
}
//struct User {
//    let uid: String
//    let email: String
//    init(authData: Firebase.User) {
//        uid = authData.uid
//        email = authData.email ?? ""
//    }
//}
// swiftlint:enable all
