//
//  Model.swift
//  OnboardingSwiftUI
//
//  Created by Kseniya Smirnova on 21.10.22.
//

import Foundation

struct Information {
    let title: String
    let description: String
    let info: String
    var isSubscribe: Bool
}

let images: [String] = ["Fire", "Forest", "Ocean"]
let video = "Falling sand"
let gif = "Goose"

let onboardingInfo = [
    Information(title: "Images",
                description: "Aliquam id ultrices eros, nec commodo arcu. ",
                info: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in lacinia quam.",
               isSubscribe: true),
    Information(title: "Video",
                description: "Interdum et malesuada fames ac ante ipsum primis in faucibus.",
                info: "Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
                isSubscribe: false),
    Information(title: "Gif",
                description: "Nam dignissim lacus in nothing sodales malesuada. ",
                info: "Aenean vel interdum lectus, eu pellentesque turpis. Interdum et malesuada fames ac ante ipsum primis in faucibus.",
                isSubscribe: false)
]
