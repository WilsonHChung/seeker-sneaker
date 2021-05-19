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
    Feed(title: "air jordan 1 bred toe",
         image: "bred_toe"),
    Feed(title: "air jordan 1 fragment",
         image: "frag_1"),
    Feed(title: "air jordan 1 shattered backboard",
         image: "shattered_1"),
    Feed(title: "nike dunk low yellow bear",
         image: "grateful_yellow"),
    Feed(title: "nike dunk low green lobster",
         image: "green_lobster"),
    Feed(title: "nike dunk low strange love",
         image: "strange_love"),
    Feed(title: "adidas yeezy 350 oreo",
         image: "oreo_350"),
    Feed(title: "adidas yeezy 350 bred",
         image: "bred_350"),
    Feed(title: "adidas yeezy 350 zebra",
         image: "zebra_350"),
    Feed(title: "nike yeezy 2 solar red",
         image: "solar_2"),
    Feed(title: "nike yeezy 2 red october",
         image: "red_2"),
    Feed(title: "nike yeezy 2 pure platinum",
         image: "platinum_2"),
]
