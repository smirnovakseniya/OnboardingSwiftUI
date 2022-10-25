//
//  Text.swift
//  OnboardingSwiftUI
//
//  Created by Kseniya Smirnova on 21.10.22.
//

import SwiftUI

extension Text {
    func customGrayText() -> some View {
        self.lineLimit(4)
            .foregroundColor(.gray)
            .textCase(.uppercase)
            .font(.system(size: 14))
    }
    func customBoldText() -> some View {
        self.bold()
            .lineLimit(4)
            .font(.system(size: 25))
    }
    func customText() -> some View {
        self.lineLimit(4)
            .foregroundColor(.gray)
            .font(.system(size: 14))
    }
}
