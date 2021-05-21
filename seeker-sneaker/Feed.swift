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
    Feed(title: "adidas yeezy 700 v3 arzareth",
         image: "adidas_v3"),
    Feed(title: "adidas yeezy boost 380 mist reflective",
         image: "adidas_mist"),
    Feed(title: "adidas yeezy boost 700 inertia",
         image: "adidas_700"),
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
    Feed(title: "adidas ultraboost 21 core black",
         image: "ultraboost_21"),
    Feed(title: "new balance 992 grey",
         image: "newbalance"),
    Feed(title: "new balance 992 kith spring 2",
         image: "newbalance_2"),
    Feed(title: "vans era colette cobra snake",
         image: "vans_snake"),
    Feed(title: "adidas top ten 2000 lakers",
         image: "adidas_lakers"),
    Feed(title: "nike blazer low dark grey",
         image: "nike_blazer"),
    Feed(title: "nike adapt huarache white black",
         image: "nike_adapt"),
    Feed(title: "nike dunk low university red (2020)",
         image: "nike_dunk"),
    Feed(title: "nike air foamposite one university blue",
         image: "nike_foam"),
    
]
