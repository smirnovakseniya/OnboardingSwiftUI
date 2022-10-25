//
//  Image.swift
//  OnboardingSwiftUI
//
//  Created by Kseniya Smirnova on 21.10.22.
//

import SwiftUI

extension Image {
    func customImage() -> some View {
        self.resizable()
            .aspectRatio(contentMode: .fill)
    }
}
