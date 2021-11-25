//
//  User.swift
//  Milky
//
//  Created by Леонід Шевченко on 11.11.2021.
//
import UIKit
// swiftlint:disable all
class Products {
    static var productsList: [Product] = [Product(productName: "Alpro",
                                                  productInformation: "This is a natural coconut drink with added soy milk for a thicker consistency. Alpro Coconut For Professionals soy drink infused with coconut aroma fills the body with energy. In addition, the plant-based, low-calorie and lactose-free Alpro Coconut For Original is a wonderful addition to coffee and tea drinks, healthy cocktails and cereals. This lactose-free product will become indispensable for those who do not consume milk. It's easy to be healthy - you should choose only natural for your diet!",
                                                  productLikes: "70",
                                                  productDislikes: "8",
                                                  productImageURL: "https://content2.rozetka.com.ua/goods/images/big/14839859.jpg",
                                                  companyUrl: "https://www.alpro.com/ua/",
                                                  productPrice: "3.50 $"),
                                          Product(productName: "Vega Milk",
                                                  productInformation: "Vega Milk is a plant-based alternative to milk that retains all the value and benefits of cereals and nuts!",
                                                  productLikes: "20",
                                                  productDislikes: "3",
                                                  productImageURL: "https://www.stonyfield.com/wp-content/uploads/2017/02/stonyfield-organic-milk-half-gallon-reduced-fat-500x500-1.png",
                                                  companyUrl: "https://vegamilk.com/ru/",
                                                  productPrice: "4.30 $"),
                                          Product(productName: "VIA MIA",
                                                  productInformation: "Rice milk contains vitamins, calcium, proteins and many other useful substances, lowers cholesterol levels, and maintains a constant blood sugar level. May be an alternative to cow's milk. Can be added to coffee, milkshakes. The drink has a good effect on the digestive system, improves skin condition. Recommended for use by people with lactose intolerance and those who lead a healthy lifestyle and monitor their figure. The taste of rice milk will appeal to both adults and children.",
                                                  productLikes: "8",
                                                  productDislikes: "20",
                                                  productImageURL: "https://content.rozetka.com.ua/goods/images/big/147163529.jpg",
                                                  companyUrl: "https://www.viamia.com.br/",
                                                  productPrice: "3.10 $"),
                                          Product(productName: "Scotti Oat",
                                                  productInformation: "A delicious herbal drink is the result of a combination of craftsmanship, the latest technology and high quality ingredients. Such milk is perfect for breakfast or at any other time during the day, as well as with coffee, tea.",
                                                  productLikes: "80",
                                                  productDislikes: "12",
                                                  productImageURL: "https://content.rozetka.com.ua/goods/images/big/12925805.jpg",
                                                  companyUrl: "https://rozetka.com.ua/riso_scotti_8001860255137/p59014030/",
                                                  productPrice: "2.50 $"),
                                          Product(productName: "Ecomil",
                                                  productInformation: "Ecomil vegetable cream is a great alternative to animal milk-based cream. With their help, you can prepare a wonderful sauce with an exquisite taste. They are ideal for hot sauces.",
                                                  productLikes: "25",
                                                  productDislikes: "5",
                                                  productImageURL: "https://content.rozetka.com.ua/goods/images/big/11809788.jpg",
                                                  companyUrl: "https://ecomil.com/en/",
                                                  productPrice: "2.75 $"),
                                          Product(productName: "Avena",
                                                  productInformation: "La Finestra Oatmeal is a certified gluten-free oat drink made from oats and natural water from the Lessine mountains. The carefully selected oats have been tested to be gluten free. This drink can be used to make Bechamel sauce, cakes and desserts, and of course a refreshing drink. Use for breakfast and for making pudding, sweet cream and all kinds of desserts.",
                                                  productLikes: "50",
                                                  productDislikes: "6",
                                                  productImageURL: "https://content.rozetka.com.ua/goods/images/big/59320467.jpg",
                                                  companyUrl: "https://www.viamia.com.br/",
                                                  productPrice: "1.90 $"),
                                          Product(productName: "La Finestra",
                                                  productInformation: "La Finestra Oatmeal is a certified gluten-free oat drink made from oats and natural water from the Lessine mountains. The carefully selected oats have been tested to be gluten free. This drink can be used to make Bechamel sauce, cakes and desserts, and of course a refreshing drink. Use for breakfast and for making pudding, sweet cream and all kinds of desserts.",
                                                  productLikes: "33",
                                                  productDislikes: "12",
                                                  productImageURL: "https://www.dutchlady.com.my/wp-content/uploads/2020/09/full-cream-milk-sterilised-900ml.jpg",
                                                  companyUrl: "https://www.lafinestrasulcielo.es/",
                                                  productPrice: "2.50 $"),
                                          Product(productName: "Aroy-D",
                                                  productInformation: "Coconut milk is a natural plant product made from coconut pulp. It is often used as an alternative to cow's milk, as it does not contain lactose and is successfully used by people who have intolerance to it and vegetarians.",
                                                  productLikes: "43",
                                                  productDislikes: "20",
                                                  productImageURL: "https://content1.rozetka.com.ua/goods/images/big/19742154.jpg",
                                                  companyUrl: "https://rozetka.com.ua/158627050/p158627050/",
                                                  productPrice: "3.20 $"),
                                          Product(productName: "Chaokoh",
                                                  productInformation: "Coconut milk is a natural plant product made from coconut pulp. It is often used as an alternative to cow's milk, as it does not contain lactose and is successfully used by people who have intolerance to it and vegetarians.",
                                                  productLikes: "30",
                                                  productDislikes: "6",
                                                  productImageURL: "https://content1.rozetka.com.ua/goods/images/big/173798661.jpg",
                                                  companyUrl: "https://rozetka.com.ua/245089153/p245089153/",
                                                  productPrice: "2.00 $"),
                                          Product(productName: "Joya",
                                                  productInformation: "Specially created for those who love coffee drinks, but do not consume milk. Almond barista is a delicate herbal drink that, when whipped, forms a fluffy foam and makes any coffee special. It has a pleasant nutty flavor, contains no lactose, no flavors or flavors, and most importantly no sugar! Try it! After all, by choosing the Joya trademark, you are choosing real Austrian quality, taste variety and health care. Ingredients: water, almonds 2.5%, maltodextrin, stabilizers: gellan gum, lecithins; acidity regulator: dical phosphate; kitchen food salt.",
                                                  productLikes: "6",
                                                  productDislikes: "30",
                                                  productImageURL: "https://content.rozetka.com.ua/goods/images/big/16531646.png",
                                                  companyUrl: "https://joya.info/en",
                                                  productPrice: "2.25 $")
    ]
}

class Product: NSObject {
    var productName: String
    var productInformation: String
    var productLikes: String
    var productDislikes: String
    var productImageURL: String?
    var companyUrl: String
    var productPrice: String
    
    init(
    productName: String,
    productInformation: String,
    productLikes: String,
    productDislikes: String,
    productImageURL: String?,
    companyUrl: String,
    productPrice: String
    ) {
        self.productName = productName
        self.productInformation = productInformation
        self.productLikes = productLikes
        self.productDislikes = productDislikes
        self.productImageURL = productImageURL
        self.companyUrl = companyUrl
        self.productPrice = productPrice
                super.init()
    }
    
//    init(from BasketProductsRealm: BasketProductsRealm) {
//        self.productName = BasketProductsRealm.productName
//        self.productInformation = BasketProductsRealm.productInformation
//        self.productLikes = BasketProductsRealm.productLikes
//        self.productDislikes = BasketProductsRealm.productDislikes
//        self.productImageURL = BasketProductsRealm.productImageURL
//        self.companyUrl = BasketProductsRealm.companyUrl
//        self.productPrice = BasketProductsRealm.productPrice
//    }
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
