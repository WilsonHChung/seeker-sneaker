//
//  Feed.swift
//  seeker-sneaker
//
//  Created by Dominic Gutierrez on 3/3/21.
//

import SwiftUI

struct Feed: Identifiable {
    var id = UUID()
    var title: String
    var image: String
}


let feedData = [
    Feed(title: "Air Jordan 1 Bred Toe",
         image: "bred_toe"),
    Feed(title: "Air Jordan 1 Fragment",
         image: "frag_1"),
    Feed(title: "Air Jordan 1 Shattered Backboard",
         image: "shattered_1"),
    Feed(title: "Nike Dunk Low Yellow Bear",
         image: "grateful_yellow"),
    Feed(title: "Nike Dunk Low Green Lobster",
         image: "green_lobster"),
    Feed(title: "Nike Dunk Low Strange Love",
         image: "strange_love"),
    Feed(title: "Adidas Yeezy 350 Oreo",
         image: "oreo_350"),
    Feed(title: "Adidas Yeezy 350 Bred",
         image: "bred_350"),
    Feed(title: "Adidas Yeezy 350 Zebra",
         image: "zebra_350"),
    Feed(title: "Nike Yeezy 2 Solar Red",
         image: "solar_2"),
    Feed(title: "Nike Yeezy 2 Red October",
         image: "red_2"),
    Feed(title: "Nike Yeezy 2 Pure Platinum",
         image: "platinum_2"),
]
