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
    var image: [String]? = nil
    var video: String? = nil
    var gif: String? = nil
    var isSubscribe: Bool
}

let images: [String] = ["Fire", "Forest", "Ocean"]

let onboardingInfo = [
    Information(title: "Images",
                description: "The standard Lorem Ipsum passage, used since the 1500s",
                info: "Lorem ipsum dolor sit amet, consectetur. Lorem ipsum dolor sit amet, consectetur adipiscing",
                image: images,
               isSubscribe: true),
    Information(title: "Video",
                description: "Video video video video Video video video video Video ",
                info: "Lorem ipsum dolor sit amet, consectetur. Lorem ipsum dolor sit amet, consectetur adipiscing",
               video: "Rain",
                isSubscribe: false),
    Information(title: "Gif",
                description: "Gif wertyhgfdesdfgh zxcvb",
                info: "DFdfghjm, gjd. xjdhgkd vjh",
                isSubscribe: false)
]


