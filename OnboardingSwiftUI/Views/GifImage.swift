//
//  GifImage.swift
//  OnboardingSwiftUI
//
//  Created by Kseniya Smirnova on 24.10.22.
//

import SwiftUI
import FLAnimatedImage

struct GifImage: UIViewRepresentable {
    private let name: String
    let animatedView = FLAnimatedImageView()

    init(_ name: String) {
        self.name = name
    }

    func makeUIView(context: UIViewRepresentableContext<GifImage>) -> UIView {
        let view = UIView()

        let path = Bundle.main.path(forResource: name, ofType: "gif")!
        let url = URL(fileURLWithPath: path)
        let gifData = try! Data(contentsOf: url)

        let gif = FLAnimatedImage(animatedGIFData: gifData)
        animatedView.animatedImage = gif

        animatedView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animatedView)

        NSLayoutConstraint.activate([
            animatedView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animatedView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<GifImage>) {}
}


//import WebKit
//
//struct GifImage: UIViewRepresentable {
//    private let name: String
//
//    init(_ name: String) {
//        self.name = name
//    }
//
//    func makeUIView(context: Context) -> WKWebView {
//        let webView = WKWebView()
//        let url = Bundle.main.url(forResource: name, withExtension: "gif")!
//        let data = try! Data(contentsOf: url)
//        webView.load(
//            data,
//            mimeType: "image/gif",
//            characterEncodingName: "UTF-8",
//            baseURL: url.deletingLastPathComponent()
//        )
//        webView.scrollView.isScrollEnabled = false
//        return webView
//    }
//
//    func updateUIView(_ uiView: WKWebView, context: Context) {
//        uiView.reload()
//    }
//}
