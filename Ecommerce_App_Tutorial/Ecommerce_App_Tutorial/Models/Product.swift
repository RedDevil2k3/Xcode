//
//  Product.swift
//  Ecommerce_App_Tutorial
//
//  Created by Abhimanyu Joshi on 8/4/23.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var description: String
    var supplier: String
    var price: Int64
    var width: String
    var height: String
    var diameter: String
}

var productList = [
    
    Product(name: "First Couch",
            image: "fn1",
            description: "description-1",
            supplier: "IKEA-1",
            price: 250,
            width: "200 cm",
            height: "150cm",
            diameter: "105cm"),
    
    Product(name: "Second Couch",
            image: "fn2",
            description: "description-2",
            supplier: "IKEA-2",
            price: 250,
            width: "200 cm",
            height: "150cm",
            diameter: "105cm"),

    Product(name: "Third Couch",
            image: "fn3",
            description: "description-3",
            supplier: "IKEA-3",
            price: 250,
            width: "200 cm",
            height: "150cm",
            diameter: "105cm"),

    Product(name: "Fourth Couch",
            image: "fn4",
            description: "description-4",
            supplier: "IKEA-4",
            price: 250,
            width: "200 cm",
            height: "150cm",
            diameter: "105cm"),

    Product(name: "Fifth Couch",
            image: "fn5",
            description: "description-5",
            supplier: "IKEA-5",
            price: 250,
            width: "200 cm",
            height: "150cm",
            diameter: "105cm"),
]
